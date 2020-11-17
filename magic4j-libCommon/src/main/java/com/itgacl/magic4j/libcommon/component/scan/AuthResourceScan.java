package com.itgacl.magic4j.libcommon.component.scan;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.*;
import java.util.stream.IntStream;

@Slf4j
@Component
public class AuthResourceScan {

    @Autowired
    private RequestMappingHandlerMapping handlerMapping;

    /**
     * 扫描使用了Auth注解标注的Controller类或者Controller类的方法
     * @return
     */
    public List<AuthRes> scan() {
        Map<RequestMappingInfo, HandlerMethod> handlerMethods = handlerMapping.getHandlerMethods();
        List<AuthRes> authResList = new ArrayList<>();
        for (Map.Entry<RequestMappingInfo, HandlerMethod> requestMappingInfoHandlerMethodEntry : handlerMethods.entrySet()) {
            boolean isUseMethodAnno = false;//是否使用标注在method上的Auth注解
            RequestMappingInfo requestMappingInfo = requestMappingInfoHandlerMethodEntry.getKey();
            HandlerMethod mappingInfoValue = requestMappingInfoHandlerMethodEntry.getValue();
            //1.判断Controller类是否标注了Auth注解，标注了这个注解的Controller类需要做访问权限控制
            Auth auth = mappingInfoValue.getBeanType().getAnnotation(Auth.class);
            if(auth == null){
                //2.再判断方法上是否标注了Auth注解
                auth = mappingInfoValue.getMethodAnnotation(Auth.class);
                if(auth == null){
                    continue;
                }
                if(!auth.isAuth()){
                    continue;
                }
                isUseMethodAnno = true;//使用的是方法上的Auth注解
            }else {
                Auth methodAnnotation = mappingInfoValue.getMethodAnnotation(Auth.class);
                if(methodAnnotation != null){//如果类和方法同时标注了Auth注解，则以方法上的Auth注解为主
                    if(!methodAnnotation.isAuth()){
                        //log.debug(mappingInfoValue.getMethod().getName()+"有Auth注解，isAuth属性为false");
                        continue;
                    }
                    auth = methodAnnotation;
                    isUseMethodAnno = true;//使用的是方法上的Auth注解
                }else {
                    if(!auth.isAuth()){//Controller类标注了Auth注解，但是isAuth为false,则不做权限拦截
                        continue;
                    }
                    isUseMethodAnno = false;//使用的是Controller类上的Auth注解
                }
            }
            RequestMethodsRequestCondition methodsCondition = requestMappingInfo.getMethodsCondition();
            //资源的Http访问请求方式，如果是以@RequestMapping(value = "/xxx",method = {RequestMethod.GET,RequestMethod.POST})注解标注的方法，则methodsCondition.getMethods()获取到的集合为[GET,POST]
            Set<RequestMethod> methodSet = new LinkedHashSet<>(methodsCondition.getMethods());//methodsCondition.getMethods()返回的Set是只读的，不能进行add操作，所以这里重新new HashSet<>构造一个可读写的Set
            if(CollectionUtil.isEmpty(methodSet)){//如果是以@RequestMapping("/xxx")注解标注的方法，则methodsCondition.getMethods()获取到的集合为空
                methodSet.add(RequestMethod.GET);
                methodSet.add(RequestMethod.POST);
                methodSet.add(RequestMethod.PUT);
                methodSet.add(RequestMethod.DELETE);
            }
            String methods = "";
            for (RequestMethod method : methodSet){
                methods += method.name()+",";
            }
            if(StringUtils.isNotEmpty(methods)){
                methods=methods.substring(0,methods.length()-1);
            }

            AuthRes authRes = new AuthRes();
            authRes.setRequestMethods(methods);
            //获取Controller的类名
            String controllerClassName = mappingInfoValue.getBeanType().getName();
            Method method = mappingInfoValue.getMethod();
            String handleMethodName = method.getName();
            //获取方法的参数类型
            //通过Spring的LocalVariableTableParameterNameDiscoverer类获取方法的参数名称
            LocalVariableTableParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();
            //获取方法的参数名称
            String[] methodParamNames = parameterNameDiscoverer.getParameterNames(method);
            if(ArrayUtil.isNotEmpty(methodParamNames)){
                //获取方法的参数类型
                Class<?>[] paramTypeArr = method.getParameterTypes();
                IntStream.range(0,methodParamNames.length).forEach(i-> authRes.getMethodParam().put(paramTypeArr[i].getName(),methodParamNames[i]));
            }
            authRes.setControllerClassName(controllerClassName);
            authRes.setMethodName(handleMethodName);
            //访问这个资源需要的权限
            String permissionValue = auth.requiresPermission();//获取注解上的value
            String permissionName = auth.name();//获取注解上的name
            String moduleName = auth.moduleName();//获取注解上的模块名
            if(StrUtil.isNotEmpty(permissionName)){
                if(isUseMethodAnno){
                    authRes.setName(permissionName);
                    authRes.setGroupName(moduleName);
                }else {
                    authRes.setName(handleMethodName);
                    authRes.setGroupName(permissionName);//Auth注解标注在类上
                }
            }else {
                authRes.setName(handleMethodName);
                authRes.setGroupName(moduleName);
            }
            PatternsRequestCondition patternsCondition = requestMappingInfo.getPatternsCondition();
            //资源的访问URL
            Set<String> patterns = new LinkedHashSet<>(patternsCondition.getPatterns());//LinkedHashSet:有序的HashSet
            for (String url : patterns){
                authRes.setRequestUrl(url);
                String permFlags ="";
                if(StrUtil.isNotEmpty(permissionValue)){
                    permFlags = permissionValue;//访问权限
                }else {
                    for (RequestMethod requestMethod : methodSet){
                        if(url.startsWith("/api")){
                            url = url.replaceAll("/api","");
                        }
                        url = url.replaceAll("/\\{.*}", "").replaceAll("/",":");
                        permFlags += requestMethod.name().toLowerCase()+url+",";//访问权限标识
                    }
                    if(StringUtils.isNotEmpty(permFlags)){
                        permFlags = permFlags.substring(0,permFlags.length()-1);
                    }
                }
                authRes.setPermFlags(permFlags);
            }
            if(StrUtil.isNotEmpty(authRes.getRequestUrl())){
                authResList.add(authRes);
            }
        }
        return authResList;
    }

    /**
     * 权限控制资源
     */
    @Data
    public static class AuthRes implements Serializable {

        /**
         * 控制器类名
         */
        private String controllerClassName;

        /**
         * 方法名
         */
        private String methodName;

        /**
         * 方法参数
         */
        private Map<String,String> methodParam = new LinkedHashMap<>();

        /**
         * 请求地址
         */
        private String requestUrl;

        /**
         * 请求方法
         */
        private String requestMethods;

        /**
         * 名称
         */
        private String name;

        /**
         * 访问权限标识
         */
        private String permFlags;

        /**
         * 分组名称
         */
        private String groupName;

    }

}
