
package com.itgacl.magic4j.libcommon.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Joiner;
import com.google.common.collect.Maps;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.*;

/**
 * web相关工具类
 */
public final class WebUtil {

    /**
     * 获取所有request请求参数key-value
     * 
     * @param request
     * @return
     */
    public static Map<String, String> getRequestParams(HttpServletRequest request) {

        Map<String, String> params = Maps.newHashMap();
        if (null != request) {
            Set<String> paramsKey = request.getParameterMap().keySet();
            for (String key : paramsKey) {
                params.put(key, request.getParameter(key));
            }
        }
        return params;
    }

    /**
     * 获取所有request请求参数key-value，过滤掉空值
     *
     * @param request
     * @return
     */
    public static Map<String, String> getNotBlankRequestParams(HttpServletRequest request) {
        Map<String, String> params = Maps.newHashMap();
        if (null != request) {
            Set<String> paramsKey = request.getParameterMap().keySet();
            for (String key : paramsKey) {
                if (StringUtils.isNotBlank(request.getParameter(key))) {
                    params.put(key, request.getParameter(key));
                }
            }
        }
        return params;
    }

    /**
     * 获得客户端IP
     * 
     * @param request
     * @return
     */
    public static String getRealIp(HttpServletRequest request) {
        //如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串Ｉｐ值
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    public static String getRealIpV2(HttpServletRequest request) {
        String accessIP = request.getHeader("x-forwarded-for");
        if (null == accessIP)
            return request.getRemoteAddr();
        return accessIP;
    }

    public static String urlEncode(String source) {
        String res = source;
        try {
            res = URLEncoder.encode(source, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return res;
    }

    /**
     * 判断是否是ajax请求
     * 
     * @param request
     * @return
     */
    public static boolean isAjax(HttpServletRequest request) {
        String flag = request.getHeader("Request-Flag");
        String requestType = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equals(requestType)) {
            return true;
        }
        return false;
    }

    /**
     * 获得带参数的URL
     *
     * @param request
     * @return
     */
    public static String getUriWidthParam(HttpServletRequest request) {
        String url = request.getRequestURI();
        String method = request.getMethod();
        if ("GET".equalsIgnoreCase(method)) {
            Map<String, String> params = getRequestParams(request);
            String join = Joiner.on("&").withKeyValueSeparator("=").join(params);
            return URLTool.builderURL(url, join);
        }
        return url;
    }

    /**
     * 获取当前请求对象
     * 
     * @return
     */
    public static HttpServletRequest getRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            return null;
        }
    }


    /**
     * 获得用户远程地址
     */
    public static String getRemoteAddr(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("X-Forwarded-For");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("Proxy-Client-IP");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
    }

    /**
     * 写出数据
     *
     * @param res 输出的字符串
     * @throws Exception
     */
    public static void write(String res, HttpServletResponse response) {
        Writer writer = null;
        try {
            res = (null == res ? "" : res);
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            writer = response.getWriter();
            writer.write(res);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            IOUtils.closeQuietly(writer);
        }
    }

    /**
     * 写出数据
     *
     * @param res 输出的字符串
     * @throws Exception
     */
    public static void writeJsonRes(String res, HttpServletResponse response) {
        Writer writer = null;
        try {
            res = (null == res ? "" : res);
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-type", "application/json;charset=UTF-8");
            writer = response.getWriter();
            writer.write(res);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            IOUtils.closeQuietly(writer);
        }
    }

    /**
     * 获取当前网络ip
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request){
        String ipAddress = request.getHeader("x-forwarded-for");
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                if(inet!=null){
                    ipAddress= inet.getHostAddress();
                }
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
            if(ipAddress.indexOf(",")>0){
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 判断是否为AJAX请求
     * @param request
     * @return
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 通用请求格式转换,兼容form和json两种格式
     * 1、判断请求数据是form格式还是json格式，（如果是from格式，则遍历直接处理数据；如果是json格式，则用缓冲字符流快速读取request中的内容，然后通过JSONObject工具转成json），将处理好的数据放到Map中；
     * 2、将Map中的数据和实体类的参数名进行匹配，匹配成功并转换正确格式后，赋给属性值，然后返回赋值后的对象，最终完成request到对象的转换。
     * @param httpServletRequest
     * @return
     */
    private static <T> T commonHttpRequestParamConvert(HttpServletRequest httpServletRequest, Class<T> classModel) {
        Map<String, String> params = new HashMap<>();
        try {
            Map<String, String[]> requestParams = httpServletRequest.getParameterMap();
            if (requestParams != null && !requestParams.isEmpty()) {
                //form格式
                requestParams.forEach((key, value) -> params.put(key, value[0]));
            } else {
                //json格式
                StringBuilder paramSb = new StringBuilder();
                String str;
                BufferedReader br = httpServletRequest.getReader();
                while((str = br.readLine()) != null){
                    paramSb.append(str);
                }
                if (paramSb.length() > 0) {
                    JSONObject paramJsonObject = JSON.parseObject(paramSb.toString());
                    if (paramJsonObject != null && !paramJsonObject.isEmpty()) {
                        paramJsonObject.forEach((key, value) -> params.put(key, String.valueOf(value)));
                    }
                }
            }
            //Field[] fields = classModel.getDeclaredFields();//获取不到基类的属性
            List<Field> fieldList = new ArrayList<>();
            Class tempClass = classModel;
            while (tempClass != null && !tempClass.getName().toLowerCase().equals("java.lang.object")) {//当父类为null的时候说明到达了最上层的父类(Object类).
                fieldList.addAll(Arrays.asList(tempClass .getDeclaredFields()));
                tempClass = tempClass.getSuperclass(); //得到父类,然后赋给自己
            }

            //将params匹配到对应model中
            T instance = classModel.newInstance();
            for (Field field : fieldList) {
                field.setAccessible(true);
                if (params.containsKey(field.getName())) { //如果map集合存在与属性名相同的键
                    //判断数据类型
                    if ("java.lang.int".equals(field.getType().getCanonicalName())
                            || "java.lang.Integer".equals(field.getType().getCanonicalName())) {
                        field.set(instance, Integer.valueOf(params.get(field.getName())));
                    } else if ("java.lang.String".equals(field.getType().getCanonicalName())) {
                        field.set(instance, params.get(field.getName()));
                    } else if ("java.lang.long".equals(field.getType().getCanonicalName())
                            || "java.lang.Long".equals(field.getType().getCanonicalName())) {
                        field.set(instance, Long.valueOf(params.get(field.getName())));
                    }else if ("java.lang.double".equals(field.getType().getCanonicalName())
                            || "java.lang.Double".equals(field.getType().getCanonicalName())) {
                        field.set(instance, Double.valueOf(params.get(field.getName())));
                    } else if ("java.lang.boolean".equals(field.getType().getCanonicalName())
                            || "java.lang.Boolean".equals(field.getType().getCanonicalName())) {
                        field.set(instance, Boolean.valueOf(params.get(field.getName())));
                    }
                }
            }
            return instance;
        } catch (Exception e) {
            throw new RuntimeException(httpServletRequest.getRemoteAddr()+"请求接口错误,数据为:"+params.toString());
        }
    }

    /**
     * 将请求的参数转换成指定对象
     * @param clz
     * @param <T>
     * @return
     */
    public static <T> T getParamObj(Class<T> clz){
        return commonHttpRequestParamConvert(getRequest(), clz);
    }
}
