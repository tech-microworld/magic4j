package com.itgacl.magic4j.common.config;

import com.itgacl.magic4j.libcommon.component.resolver.Magic4jMethodArgumentResolver;
import com.itgacl.magic4j.common.interceptor.LoginInterceptor;
import com.itgacl.magic4j.common.interceptor.NotEmptyInterceptor;
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
    private final NotEmptyInterceptor notEmptyInterceptor;

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

    @Value("${magic4j.storage.local.fileUrlPathPattern}")
    private String fileUrlPathPattern; //上传到本地服务器的文件的访问映射地址

    /**
     * 构造注入
     * @param autoIdempotentInterceptor
     * @param magic4jMethodArgumentResolver
     * @param notEmptyInterceptor
     * @param loginInterceptor
     * @param authInterceptor
     */
    @Autowired
    public Magic4jWebMvcConfigurer(AutoIdempotentInterceptor autoIdempotentInterceptor, Magic4jMethodArgumentResolver magic4jMethodArgumentResolver, NotEmptyInterceptor notEmptyInterceptor, LoginInterceptor loginInterceptor, AuthInterceptor authInterceptor) {
        this.autoIdempotentInterceptor = autoIdempotentInterceptor;
        this.magic4jMethodArgumentResolver = magic4jMethodArgumentResolver;
        this.notEmptyInterceptor = notEmptyInterceptor;
        this.loginInterceptor = loginInterceptor;
        this.authInterceptor = authInterceptor;
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
                        "/api/auth/token/refresh",
                        "/api/cache/**",
                        "/api/tool/**",
                        "/api/storage/**",
                        "/error",
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
                        "/api/storage/**",
                        "/error",
                        fileUrlPathPattern
                );
        registry.addInterceptor(autoIdempotentInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/error");
        //拦截所有请求
        registry.addInterceptor(notEmptyInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/error");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(magic4jMethodArgumentResolver);//添加自定义请求参数解析器
        OrderComparator.sort(resolvers);
    }
}
