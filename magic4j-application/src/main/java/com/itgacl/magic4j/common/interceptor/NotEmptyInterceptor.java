package com.itgacl.magic4j.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.libcommon.annotation.NotEmpty;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.MessageFormat;

/**
 * 非空校验拦截器
 */
@Component
public class NotEmptyInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(NotEmptyInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        logger.debug(">>>NotEmptyInterceptor>>>>>>>非空校验");
        HandlerMethod method = (HandlerMethod) handler;
        //获取方法上的注解非空校验注解
        NotEmpty notEmpty = method.getMethodAnnotation(NotEmpty.class);
        if (notEmpty != null) {//进行非空校验
            logger.debug("{}方法上有NotEmpty注解，进行非空校验", method.getMethod().getName());
            String[] paramNameArr = notEmpty.value();
            String[] msgArr = notEmpty.message();
            int len = paramNameArr.length;
            String errMsg;
            for (int i = 0; i < len; i++) {
                String paramName = paramNameArr[i];
                String paramVal = request.getParameter(paramName);
                if (StringUtils.isEmpty(paramVal)) {//找到值为空的参数
                    logger.debug("{}值为空", paramName);
                    if (i < msgArr.length) {
                        errMsg = msgArr[i];
                    } else {
                        errMsg = MessageFormat.format("{0}的值不能为空", paramName);
                    }
                    WebUtil.writeJsonRes(JSON.toJSONString(R.fail(errMsg)), response);//输出错误响应消息
                    return false;//返回false取消当前请求，不再往下执行
                }
            }
        }
        return super.preHandle(request, response, handler);
    }
}
