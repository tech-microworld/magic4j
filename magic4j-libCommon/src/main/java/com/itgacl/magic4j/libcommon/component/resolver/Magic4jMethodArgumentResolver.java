package com.itgacl.magic4j.libcommon.component.resolver;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.core.MethodParameter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;
import org.springframework.web.servlet.mvc.method.annotation.ServletModelAttributeMethodProcessor;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 自定义参数解析器(同时支持form提交和json提交)
 * 应用场景：
 * 对于同一接口有时使用json格式提交，有时使用表单形式提交，项目使用的是前后端分离模式，需要自定义参数解析器。
 * SpringMVC中对json形式和表单形式的参数解析器都有实现，因而不需要我们自己去实现具体参数解析，而是在原有的功能方面进行增强，可利用java中的装饰器模式去实现
 */
@Slf4j
@Component
public class Magic4jMethodArgumentResolver implements HandlerMethodArgumentResolver, Ordered, ApplicationListener {

    private List<HandlerMethodArgumentResolver> localResolver = new ArrayList<>();

    private boolean seal;

    //对应json格式的数据解析，SpringMVC中已实现
    private RequestResponseBodyMethodProcessor requestResponseBodyMethodProcessor;

    //对应表单格式的数据解析，SpringMVC中已实现
    private ServletModelAttributeMethodProcessor servletModelAttributeMethodProcessor;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        if (parameter.hasParameterAnnotation(FormOrJson.class)) {
            log.info("will user CustomMethodArgumentResolver to resolve parameter for:{}", parameter.getExecutable());
            return true;
        }
        return false;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) webRequest.getNativeRequest();
        //根据请求头Content-Type，判断是什么形式提交
        String contentType = httpServletRequest.getHeader("Content-Type");
        if (StringUtils.isEmpty(contentType)) { //没有，默认用表单
            return servletModelAttributeMethodProcessor.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
        }
        //表单形式
        if (contentType.startsWith("application/x-www-form-urlencoded")) {
            log.info("the contentType is application/x-www-form-urlencoded ");
            return servletModelAttributeMethodProcessor.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
        }
        //json形式
        if (contentType.startsWith("application/json")) {
            log.info("the contentType is application/json ");
            return requestResponseBodyMethodProcessor.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
        }
        return servletModelAttributeMethodProcessor.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
    }

    private Object doContinueResolver(List<HandlerMethodArgumentResolver> localResolver, MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        //移除,自定义解析器，继续解析
        if (CollectionUtils.isEmpty(localResolver)) {
            log.warn("localResolver is empty");
            return null;
        }
        localResolver.remove(this);
        for (HandlerMethodArgumentResolver resolver : localResolver) {
            if (resolver.supportsParameter(parameter)) {
                return resolver.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
            }
        }
        throw new Exception("自定义解析参数出现异常，无法解析该参数:" + parameter.getParameter());

    }

    @Override
    public int getOrder() {
        return HIGHEST_PRECEDENCE + 1;
    }


    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (!seal) {
            //响应ApplicationReadyEvent事件，表明tomcat(jetty)容器已将上下文填充完毕，从而从容器中获取json和表单的参数解析器
            if (event instanceof ApplicationReadyEvent) {
                RequestMappingHandlerAdapter requestMappingHandlerAdapter = (RequestMappingHandlerAdapter) ((ApplicationReadyEvent) event).getApplicationContext().getBean("requestMappingHandlerAdapter");
                if (Objects.isNull(requestMappingHandlerAdapter)) {
                    throw new RuntimeException("自定义参数解析器加载失败");
                }
                for (HandlerMethodArgumentResolver resolver : requestMappingHandlerAdapter.getArgumentResolvers()) {
                    if (resolver instanceof RequestResponseBodyMethodProcessor) { //获取json形式的解析器
                        this.requestResponseBodyMethodProcessor = (RequestResponseBodyMethodProcessor) resolver;
                        continue;
                    }
                    if (resolver instanceof ServletModelAttributeMethodProcessor) { //获取表单形式的解析器
                        this.servletModelAttributeMethodProcessor = (ServletModelAttributeMethodProcessor) resolver;
                    }
                }
                localResolver.addAll(requestMappingHandlerAdapter.getArgumentResolvers());
                this.seal = true;
            }
        }
    }
}
