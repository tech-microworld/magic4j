package com.itgacl.magic4j.libcommon.interceptor;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.annotation.Regex;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.MessageFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 参数校验拦截器
 */
@Slf4j
@Component
public class ValidatorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        HandlerMethod method = (HandlerMethod) handler;
        boolean isPass = true;//是否通过校验
        String errMsg = "";
        //获取方法上的校验注解
        Validator validator = method.getMethodAnnotation(Validator.class);
        if (validator != null) {//进行非空校验
            String[] paramNameArr = validator.value();//获取注解上要校验的参数名
            String[] msgArr = validator.message();//错误提示消息
            int len = paramNameArr.length;

            for (int i = 0; i < len; i++) {
                String paramName = paramNameArr[i];
                String paramVal = request.getParameter(paramName);
                if (StringUtils.isBlank(paramVal)) {//找到值为空的参数
                    isPass = false;
                    if (i < msgArr.length) {
                        if(StrUtil.isNotBlank(msgArr[i])){
                            errMsg = msgArr[i];//获取用户设置的错误提示消息
                        }else {
                            //设置默认提示消息
                            errMsg = MessageFormat.format("{0}不能为空", paramName);
                        }
                    } else {
                        errMsg = MessageFormat.format("{0}的值不能为空", paramName);
                    }
                }
            }
            if (!isPass) {
                //非空校验不通过，不再往下处理
                WebUtil.writeJsonRes(JSON.toJSONString(R.fail(errMsg)), response);//输出错误响应消息
                return false;//返回false取消当前请求，不再往下执行
            }
        }

        Regex regex = method.getMethodAnnotation(Regex.class);//获取方法上的Regex注解
        if (regex != null) {
            String[] paramNameArr = regex.value();//获取注解上要校验的参数名
            String[] regexArr = regex.regex();//获取注解上的正则表达式
            String[] msgArr = regex.message();//错误提示消息
            int len = paramNameArr.length;
            int regexLen = regexArr.length;
            if(regexLen == 1){//所有参数共用一个正则表达式进行校验
                for (int i = 0; i < len; i++) {
                    String paramName = paramNameArr[i];
                    String paramVal = request.getParameter(paramName);
                    if(StrUtil.isEmpty(paramVal)){
                        continue;
                    }
                    String regEx = regexArr[0];//所有参数共用一个正则表达式进行校验
                    // 编译正则表达式
                    Pattern pattern = Pattern.compile(regEx);
                    //判断是否匹配
                    Matcher matcher = pattern.matcher(paramVal);
                    if (!matcher.find()) {//如果不匹配
                        isPass = false;
                        if (i < msgArr.length) {
                            errMsg = msgArr[i];//获取用户设置的错误提示消息
                        } else {
                            //设置默认提示消息
                            errMsg = MessageFormat.format("{0}的值{1}不正确", paramName, paramVal);
                        }
                        break;
                    }
                }
            }else {
                if(regexLen != len){
                    //正则表达式和参数个数不匹配
                    errMsg = "正则表达式和参数个数不匹配";
                    WebUtil.writeJsonRes(JSON.toJSONString(R.fail(errMsg)), response);//输出错误响应消息
                    return false;//返回false取消当前请求，不再往下执行
                }
                for (int i = 0; i < len; i++) {
                    String paramName = paramNameArr[i];
                    String paramVal = request.getParameter(paramName);
                    String regEx = regexArr[i];
                    // 编译正则表达式
                    Pattern pattern = Pattern.compile(regEx);
                    //判断是否匹配
                    Matcher matcher = pattern.matcher(paramVal);
                    if (!matcher.find()) {//如果不匹配
                        isPass = false;
                        if (i < msgArr.length) {
                            errMsg = msgArr[i];//获取用户设置的错误提示消息
                        } else {
                            //设置默认提示消息
                            errMsg = MessageFormat.format("{0}的值{1}不正确", paramName, paramVal);
                        }
                        break;
                    }
                }
            }
            if (!isPass) {
                //正则校验不通过，不再往下处理
                WebUtil.writeJsonRes(JSON.toJSONString(R.fail(errMsg)), response);//输出错误响应消息
                return false;//返回false取消当前请求，不再往下执行
            }
        }
        return super.preHandle(request, response, handler);
    }
}
