package com.itgacl.magic4j.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.common.cache.biz.BizCacheService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * App登录拦截器，拦截所有需要登录才能访问的Restful API
 */
@Slf4j
@Component
public class AppLoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private BizCacheService bizCacheService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        //todo 待实现的登录判断处理逻辑
        return super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
