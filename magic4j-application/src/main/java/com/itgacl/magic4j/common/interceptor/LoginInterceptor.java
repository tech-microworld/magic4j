package com.itgacl.magic4j.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.bizCache.BizCacheService;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.common.jwt.JwtConfig;
import com.itgacl.magic4j.common.jwt.JwtTokenFactory;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.libcommon.util.WebUtil;
import com.itgacl.magic4j.libcommon.util.ip.AddressUtils;
import com.itgacl.magic4j.libcommon.util.ip.IpUtils;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import eu.bitwalker.useragentutils.UserAgent;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 登录拦截器，拦截所有需要登录才能访问的Restful API
 */
@Slf4j
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private JwtTokenFactory jwtTokenFactory;

    @Autowired
    private BizCacheService bizCacheService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return super.preHandle(request, response, handler);
        }
        LoginUser loginUser;
        if(jwtTokenFactory.getJwtConfig().isEnabled()){//开启了jwt token验证
            //解析Jwt获取登录用户信息
            loginUser = getLoginUserFromJwt(request);
        }else {
            //从缓存中获取登录用户信息
            loginUser = getLoginUserFromCache(request);
        }
        if(loginUser == null) {//用户未登录
            WebUtil.writeJsonRes(JSON.toJSONString(R.fail("用户未登录")), response);
            return false;
        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
        LoginUserContext.remove();//使用完ThreadLocal变量用threadLocal.remove()来手动清除，防止内存泄露
        super.afterCompletion(request, response, handler, ex);
    }

    private LoginUser getLoginUserFromJwt(HttpServletRequest request) {
        JwtConfig jwtConfig = jwtTokenFactory.getJwtConfig();
        String token = request.getHeader(jwtConfig.getAuthorization());
        if (StringUtils.isNotEmpty(token) && token.startsWith(Constants.TOKEN_PREFIX)) {
            token = token.replace(Constants.TOKEN_PREFIX, "");
        }
        //解析Jwt获取登录用户信息
        LoginUser loginUser = jwtTokenFactory.parseJwtToken(token);
        if (loginUser != null) {
            List<String> userPerms = bizCacheService.getUserPerm(loginUser.getId());
            loginUser.setPermsList(userPerms);
            TokenDTO tokenDTO = new TokenDTO();
            tokenDTO.setToken(token);
            tokenDTO.setType(Constants.TOKEN_TYPE.JWT);
            tokenDTO.setReqHeaderKey(jwtConfig.getAuthorization());
            LoginUserContext.set(loginUser, tokenDTO);//存储到ThreadLocal，利用ThreadLocal管理登录用户信息实现随用随取
        }
        setUserAgent(loginUser, request);
        return loginUser;
    }

    private LoginUser getLoginUserFromCache(HttpServletRequest request){
        String token = request.getHeader(Constants.LOGIN_USER.AUTHORIZATION);
        //从缓存中获取当前登录的系统用户
        LoginUser loginUser = bizCacheService.getLoginUser(token);
        if(loginUser != null){
            TokenDTO tokenDTO = new TokenDTO();
            tokenDTO.setToken(token);
            tokenDTO.setType(Constants.TOKEN_TYPE.SESSION);
            tokenDTO.setReqHeaderKey(Constants.LOGIN_USER.AUTHORIZATION);
            LoginUserContext.set(loginUser,tokenDTO);//存储到ThreadLocal，利用ThreadLocal管理登录用户信息实现随用随取
        }
        return loginUser;
    }

    /**
     * 设置用户代理信息
     *
     * @param loginUser 登录信息
     */
    private void setUserAgent(LoginUser loginUser,HttpServletRequest request) {
        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        String ip = IpUtils.getIpAddr(request);
        loginUser.setIpAddress(ip);
        loginUser.setLoginLocation(AddressUtils.getRealAddressByIP(ip));
        loginUser.setBrowser(userAgent.getBrowser().getName());
        loginUser.setOs(userAgent.getOperatingSystem().getName());
    }
}
