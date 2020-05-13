package com.itgacl.magic4j.libcommon.controller;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.Map;

/**
 * 所有Controller的父类
 */
public class Magic4jBaseController {
    //日志打印
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    protected CacheService cacheService; //缓存

    /**
     * 获取当前请求对象
     *
     * @return
     */
    protected HttpServletRequest getRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            throw new RuntimeException("获取request失败", e);
        }
    }

    /**
     * 将请求参数转换成指定的DTO对象
     * @param clz
     * @param <T>
     * @return
     */
    protected <T> T getParamObj(Class<T> clz){
       return WebUtil.getParamObj(clz);
    }

    protected HttpSession getSession(HttpServletRequest request) {
        return request.getSession();
    }

    protected Map<String, String> getParams(HttpServletRequest request) {
        return WebUtil.getRequestParams(request);
    }

    protected Map<String, String> getNotBlankParams(HttpServletRequest request) {
        return WebUtil.getNotBlankRequestParams(request);
    }

    /**
     * 写出数据
     *
     * @param res 输出的字符串
     * @throws Exception
     */
    protected void write(String res, HttpServletResponse response) {
        Writer writer = null;
        try {
            res = (null == res ? "" : res);
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            writer = response.getWriter();
            logger.debug("输出JSON字符串：" + res);
            writer.write(res);
        } catch (IOException e) {
            logger.error("输出JSON字符串异常", e);
        } finally {
            IOUtils.closeQuietly(writer);
        }
    }

    /**
     * 客户端重定向
     *
     * @param url
     * @return
     */
    protected String redirect(String url) {
        return "redirect:" + url;
    }

    /**
     * 服务端重定向
     *
     * @param url
     * @return
     */
    protected String forward(String url) {
        return "forward:" + url;
    }
    /**
     * 初始化数据绑定 1. 将所有传递进来的String进行HTML编码，防止XSS攻击 2. 将字段中Date类型转换为String类型
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if(StrUtil.isNotEmpty(text)){
                    setValue(DateUtils.parseDate(text));
                }
            }
        });
        /**
         * 防止XSS ,sql攻击
         */
        //binder.registerCustomEditor(String.class, new StringEscapeEditor());
    }

}
