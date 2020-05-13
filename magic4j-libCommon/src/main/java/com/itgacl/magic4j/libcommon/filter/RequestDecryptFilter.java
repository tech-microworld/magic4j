package com.itgacl.magic4j.libcommon.filter;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.URLUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import cn.hutool.db.Db;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.parser.Feature;
import com.itgacl.magic4j.libcommon.annotation.Encrypt;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.annotation.AnnotationAwareOrderComparator;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.FilterChain;
import javax.servlet.ReadListener;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * 请求解密过滤器
 */
@Slf4j
public class RequestDecryptFilter extends OncePerRequestFilter implements ApplicationContextAware {

    /** 方法映射集 */
    private List<HandlerMapping> handlerMappings;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            Object handler = getHandler(request).getHandler();
            if (handler instanceof HandlerMethod) {
                HandlerMethod method = (HandlerMethod) handler;
                //扫描被Encrypt标记的方法
                Encrypt encrypt = method.getMethodAnnotation(Encrypt.class);
                if (encrypt != null) {
                    if (encrypt.value() == Encrypt.Type.NONE) {
                        filterChain.doFilter(request, response);
                    }else {
                        //处理数据解密
                        // 调用自定义request解析参数
                        filterChain.doFilter(new DecryptRequest(request,encrypt), response);
                    }
                }else {
                    filterChain.doFilter(request, response);
                }
            }else {
                filterChain.doFilter(request, response);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            filterChain.doFilter(request, response);
        }
    }

    /**
     * 获取访问目标方法
     *
     * @param request
     * @return HandlerExecutionChain
     * @throws Exception
     */
    private HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
        if (this.handlerMappings != null) {
            for (HandlerMapping hm : this.handlerMappings) {
                HandlerExecutionChain handler = hm.getHandler(request);
                if (handler != null) {
                    return handler;
                }
            }
        }
        return null;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        Map<String, HandlerMapping> matchingBeans = BeanFactoryUtils.beansOfTypeIncludingAncestors(applicationContext,
                HandlerMapping.class, true, false);
        if (!matchingBeans.isEmpty()) {
            this.handlerMappings = new ArrayList<>(matchingBeans.values());
            // We keep HandlerMappings in sorted order.
            AnnotationAwareOrderComparator.sort(this.handlerMappings);
        }
    }

    private class DecryptRequest extends HttpServletRequestWrapper {

        private static final String APPLICATION_JSON = "application/json";
        /** 所有参数的Map集合 */
        private Map<String, String[]> newParameterMap;
        /** 输入流 */
        private InputStream inputStream;

        DecryptRequest(HttpServletRequest request, Encrypt encryptAnno) throws IOException {
            super(request);
            String contentType = request.getHeader("Content-Type");
            log.debug("DecryptRequest -> contentType:{}", contentType);
            CacheService cacheService = SpringContextUtils.getBean(CacheService.class);
            //获取AES解密秘钥
            String aesKey = cacheService.get(Constants.SECURITY.AES_SECRET_KEY, () -> {
                // 通过DB获取AES秘钥
                DataSource dataSource = SpringContextUtils.getBean(DataSource.class);
                try {
                    return Db.use(dataSource).queryString("SELECT config_value FROM sys_config WHERE config_key=? AND status=0 AND delete_flag=0", Constants.SYS_CONFIG_KEY.AES_SECRET_KEY);
                } catch (Exception e) {
                    return null;
                }
            });
            String privateKey = cacheService.get(Constants.SECURITY.RSA_PRIVATE_KEY, () -> {
                // 通过DB获取RSA秘钥对
                DataSource dataSource = SpringContextUtils.getBean(DataSource.class);
                try {
                    String rsaKeyPair = Db.use(dataSource).queryString("SELECT config_value FROM sys_config WHERE config_key=? AND status=0 AND delete_flag=0", Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR);
                    return JSONObject.parseObject(rsaKeyPair).getString("privateKey");
                } catch (Exception e) {
                    return null;
                }
            });
            if (null != contentType && contentType.contains(APPLICATION_JSON)) {//以JSON方式提交
                ServletInputStream io = request.getInputStream();//读取输入流
                ByteArrayOutputStream os = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int length;
                while ((length = io.read(buffer)) != -1) {
                    os.write(buffer, 0, length);
                }
                byte[] bytes = os.toByteArray();
                String decryptJsonStr = "";
                if(encryptAnno.value() == Encrypt.Type.AES){
                    decryptJsonStr = aesDecrypt(new String(bytes),aesKey);//进行AES解密
                }else if(encryptAnno.value() == Encrypt.Type.RSA){
                    decryptJsonStr = rsaDecrypt(new String(bytes),privateKey);//进行RSA解密
                }
                log.info("DecryptRequest -> decryptJsonStr:{}", decryptJsonStr);
                if (this.inputStream == null) {
                    //将解密后的数据重新放入inputStream
                    this.inputStream = new DecryptInputStream(new ByteArrayInputStream(decryptJsonStr.getBytes()));
                }
            } else {
                // 以form表单的方式提交，和前端约定好以encryptParam为Key进行提交
                String encryptData = request.getParameter("encryptParam");
                log.info("DecryptRequest -> encryptData:{}", encryptData);
                String decryptVal = "";
                if(encryptAnno.value() == Encrypt.Type.AES){
                    //进行AES解密
                    decryptVal = aesDecrypt(encryptData, aesKey);
                }else if(encryptAnno.value() == Encrypt.Type.RSA){
                    //进行RSA解密
                    decryptVal = rsaDecrypt(encryptData, privateKey);
                }
                log.info("DecryptRequest -> before decode decryptVal:{}", decryptVal);
                decryptVal =  URLUtil.decode(decryptVal);//将请求参数中被转义的特殊字符还原
                log.info("DecryptRequest -> after decode decryptVal:{}", decryptVal);
                newParameterMap = buildParameterMap(decryptVal);//解密后的参数
            }
        }

        private Map<String, String[]> buildParameterMap(String src) {
            Map<String, String[]> map = new HashMap<>();
            String[] arr = src.split("&");
            for (String s : arr){
                String key = s.split("=")[0];
                String value = s.split("=")[1];
                map.put(key,new String[] {value});
            }
            return map;
        }

        /**
         * rsa解密数据
         * @param encryptData
         * @return
         */
        private String rsaDecrypt(String encryptData,String privateKey) {
            try {
                // 解密
                //已知私钥和密文，解密密文
                RSA rsa = new RSA(privateKey, null);
                return rsa.decryptStr(encryptData, KeyType.PrivateKey);
            } catch (Exception e) {
                log.error(e.getMessage(),e);
                return encryptData;
            }
        }

        /**
         * Aes解密
         * @param encryptData
         * @param aesKey
         * @return
         */
        private String aesDecrypt(String encryptData,String aesKey) {
            try {
                byte[] key = aesKey.getBytes();
                // 解密
                return SecureUtil.aes(key).decryptStr(encryptData);
            } catch (Exception e) {
                log.error(e.getMessage(),e);
                return encryptData;//解密失败就直接返回原始数据
            }
        }

        @Override
        public String getParameter(String name) {
            String[] values = getParameterMap().get(name);
            if (values != null) {
                return (values.length > 0 ? values[0] : null);
            }
            return super.getParameter(name);
        }

        @Override
        public String[] getParameterValues(String name) {
            String[] values = getParameterMap().get(name);
            if (values != null) {
                return values;
            }
            return super.getParameterValues(name);
        }

        @Override
        public Enumeration<String> getParameterNames() {
            Map<String, String[]> multipartParameters = getParameterMap();
            if (multipartParameters.isEmpty()) {
                return super.getParameterNames();
            }

            Set<String> paramNames = new LinkedHashSet<>();
            Enumeration<String> paramEnum = super.getParameterNames();
            while (paramEnum.hasMoreElements()) {
                paramNames.add(paramEnum.nextElement());
            }
            paramNames.addAll(multipartParameters.keySet());
            return Collections.enumeration(paramNames);
        }

        @Override
        public Map<String, String[]> getParameterMap() {
            return null == newParameterMap ? super.getParameterMap() : newParameterMap;
        }

        @Override
        public ServletInputStream getInputStream() throws IOException {
            return this.inputStream == null ? super.getInputStream() : (ServletInputStream) this.inputStream;
        }
    }

    /**
     * 自定义ServletInputStream
     *
     */
    private class DecryptInputStream extends ServletInputStream {

        private final InputStream sourceStream;

        /**
         * Create a DelegatingServletInputStream for the given source stream.
         *
         * @param sourceStream
         *            the source stream (never {@code null})
         */
        DecryptInputStream(InputStream sourceStream) {
            Assert.notNull(sourceStream, "Source InputStream must not be null");
            this.sourceStream = sourceStream;
        }

        @Override
        public int read() throws IOException {
            return this.sourceStream.read();
        }

        @Override
        public void close() throws IOException {
            super.close();
            this.sourceStream.close();
        }

        @Override
        public boolean isFinished() {
            return false;
        }

        @Override
        public boolean isReady() {
            return false;
        }

        @Override
        public void setReadListener(ReadListener readListener) {

        }
    }
}
