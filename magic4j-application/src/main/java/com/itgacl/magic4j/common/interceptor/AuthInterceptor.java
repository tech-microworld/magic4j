package com.itgacl.magic4j.common.interceptor;

import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import com.itgacl.magic4j.modules.sys.service.SysResourceService;
import com.itgacl.magic4j.modules.sys.vo.ResourcePermVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * 权限拦截器
 */
@Slf4j
@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private SysResourceService sysResourceService;

    @Value("${magic4j.authPermission}")
    private Boolean authPermission;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        if(!authPermission){
            return super.preHandle(request, response, handler);
        }
        try{
            LoginUser loginUser = LoginUserContext.get();//获取当前登录的系统用户
            //该登录用户所拥有的权限
            List<String> permList = loginUser.getPermsList();
            HandlerMethod method = (HandlerMethod) handler;
            //获取方法上的Auth注解
            Auth auth = method.getMethodAnnotation(Auth.class);
            if (auth != null) {
                if(!auth.isAuth()){
                    return super.preHandle(request, response, handler);// 只有返回true才会继续向下执行，返回false取消当前请求
                }
                //访问这个资源需要的权限
                String permissionValue = auth.requiresPermission();//获取注解上的value
                if(!permList.contains(permissionValue)) {
                    //用户所拥有的权限列表不包含访问目标资源需要的权限，无法访问
                    WebUtil.writeJsonRes(JSON.toJSONString(R.fail("没有访问权限，请联系管理员授权")), response);
                    return false;//返回false取消当前请求，不再往下执行
                }
            }else {
                PathMatcher pathMatcher = new AntPathMatcher();//路径匹配器
                //获取要访问的资源
                String requestUri = request.getRequestURI();
                String requestMethod = request.getMethod();//使用的HTTP请求方法
                List<ResourcePermVo> resourcePerms = sysResourceService.getResourcePerms(requestMethod);
                if(CollectionUtil.isEmpty(resourcePerms)){//不需要访问权限
                    return super.preHandle(request, response, handler);// 只有返回true才会继续向下执行，返回false取消当前请求
                }
                ResourcePermVo targetPermVo = null;
                for(ResourcePermVo res:resourcePerms){
                    //匹配请求方法与访问URL(如果请求方式一样，/sys/xxx/{id}与/sys/xxx/xxx 这样的两个URL会匹配成功)
                   boolean isMatch = res.getRequestType().equalsIgnoreCase(requestMethod) && pathMatcher.match(res.getMappingUrl(), requestUri);
                   if(isMatch){
                       targetPermVo = res;
                       break;
                   }
                }
                if(targetPermVo == null){
                    return super.preHandle(request, response, handler);// 只有返回true才会继续向下执行，返回false取消当前请求
                }
                String perm = targetPermVo.getPerms();//获取访问该资源需要使用的权限
                if (StringUtils.isNotEmpty(perm)) {
                    if (!permList.containsAll(Arrays.asList(perm.trim().split(",")))) {
                        //用户所拥有的权限列表不包含访问目标资源需要的权限，无法访问
                        WebUtil.writeJsonRes(JSON.toJSONString(R.fail("没有访问权限，请联系管理员授权")), response);
                        return false;//返回false取消当前请求，不再往下执行
                    }
                }
            }
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }
        return super.preHandle(request, response, handler);// 只有返回true才会继续向下执行，返回false取消当前请求
    }
}
