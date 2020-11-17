package com.itgacl.magic4j.common.config;

import com.itgacl.magic4j.common.interceptor.AppLoginInterceptor;
import com.itgacl.magic4j.libcommon.component.resolver.Magic4jMethodArgumentResolver;
import com.itgacl.magic4j.common.interceptor.LoginInterceptor;
import com.itgacl.magic4j.libcommon.interceptor.ValidatorInterceptor;
import com.itgacl.magic4j.common.interceptor.AuthInterceptor;
import com.itgacl.magic4j.libcommon.interceptor.AutoIdempotentInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.OrderComparator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * springBoot2后，使用WebMvcConfigurer添加拦截器
 */
@Configuration
public class Magic4jWebMvcConfigurer implements WebMvcConfigurer {

    /**
     * 自定义方法请求参数解析器
     */
    private final Magic4jMethodArgumentResolver magic4jMethodArgumentResolver;

    /**
     * 非空校验拦截器
     */
    private final ValidatorInterceptor validatorInterceptor;

    /**
     * 登录拦截器
     */
    private final LoginInterceptor loginInterceptor;

    /**
     * 权限验证拦截器
     */
    private final AuthInterceptor authInterceptor;

    /**
     * 幂等性校验拦截器
     */
    private final AutoIdempotentInterceptor autoIdempotentInterceptor;

    /**
     *
     * App登录拦截器
     */
    private final AppLoginInterceptor appLoginInterceptor;

    @Value("${magic4j.storage.local.fileUrlPathPattern}")
    private String fileUrlPathPattern; //上传到本地服务器的文件的访问映射地址

    /**
     * 构造注入
     * @param autoIdempotentInterceptor
     * @param magic4jMethodArgumentResolver
     * @param validatorInterceptor
     * @param loginInterceptor
     * @param authInterceptor
     * @param appLoginInterceptor
     */
    @Autowired
    public Magic4jWebMvcConfigurer(AutoIdempotentInterceptor autoIdempotentInterceptor, Magic4jMethodArgumentResolver magic4jMethodArgumentResolver, ValidatorInterceptor validatorInterceptor, LoginInterceptor loginInterceptor, AuthInterceptor authInterceptor, AppLoginInterceptor appLoginInterceptor) {
        this.autoIdempotentInterceptor = autoIdempotentInterceptor;
        this.magic4jMethodArgumentResolver = magic4jMethodArgumentResolver;
        this.validatorInterceptor = validatorInterceptor;
        this.loginInterceptor = loginInterceptor;
        this.authInterceptor = authInterceptor;
        this.appLoginInterceptor = appLoginInterceptor;
    }

    /**
     * 配置拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/api/**")
                .excludePathPatterns(
                        "/api/captchaImage",
                        "/api/login",
                        "/api/logout",
                        "/api/access/areaMap",
                        "/api/auth/token/refresh",
                        "/api/cache/**",
                        "/api/tool/**",
                        "/api/comm/**",
                        "/api/storage/**",
                        "/api/email/**",
                        "/api/sys/cnArea/updateData",
                        "/error",
                        fileUrlPathPattern
                );

        registry.addInterceptor(appLoginInterceptor)
                .addPathPatterns("/app/api/**")
                .excludePathPatterns(
                        "/app/api/user/login",
                        fileUrlPathPattern
                );

        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/api/**")
                .excludePathPatterns(
                        "/api/captchaImage",
                        "/api/login",
                        "/api/logout",
                        "/api/auth/token/refresh",
                        "/api/login/user",
                        "/api/cache/**",
                        "/api/tool/**",
                        "/api/comm/**",
                        "/api/storage/**",
                        "/api/email/**",
                        "/error",
                        fileUrlPathPattern
                );
        registry.addInterceptor(autoIdempotentInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/error");
        //拦截所有请求
        registry.addInterceptor(validatorInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/error");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(magic4jMethodArgumentResolver);//添加自定义请求参数解析器
        OrderComparator.sort(resolvers);
    }
}
