package com.itgacl.magic4j.libcommon.interceptor;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.libcommon.annotation.AutoIdempotent;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * 校验方法幂等性的拦截器：主要的功能是拦截使用了AutoIdempotent注解的方法，然后校验幂等性
 */
@Component
public class AutoIdempotentInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private CacheService cacheService;

    @Value("${magic4j.idempotent.authorization}")
    private String authorization; //幂等性Token请求头

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();
        //被AutoIdempotent标记的扫描
        AutoIdempotent methodAnnotation = method.getAnnotation(AutoIdempotent.class);
        if (methodAnnotation != null) {
            try {
                return checkIdempotent(request);// 幂等性校验, 校验通过则放行, 校验失败则抛出异常, 并通过统一异常处理返回友好提示
            }catch (Exception ex){
                WebUtil.writeJsonRes(JSON.toJSONString(R.fail(ex.getMessage())), response);
                return false;
            }
        }
        return super.preHandle(request, response, handler);
    }

    /**
     * 校验幂等性
     * @param request
     * @return
     */
    private boolean checkIdempotent(HttpServletRequest request){
        String token = request.getHeader(authorization);
        if (StrUtil.isBlank(token)) {// header中不存在token
            token = request.getParameter(authorization);
            if (StrUtil.isBlank(token)) {// parameter中也不存在token
                throw new Magic4jException("请求方法缺少幂等性校验Token");
            }
        }
        String cacheToken = cacheService.get(token,true);
        if (StrUtil.isEmpty(cacheToken)) {
            throw new Magic4jException("重复请求");
        }
        return true;
    }
}
