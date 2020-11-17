package com.itgacl.magic4j.common.config;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import com.google.common.base.Predicate;


@EnableSwagger2
@Configuration
@ConditionalOnProperty(name = "magic4j.swagger.enable", havingValue = "true") //配置文件中配置swagger.enable =true表示开启swagger文档，配置swagger.enable=false表示关闭swagger文档
public class SwaggerConfig {

    @Value("${magic4j.swagger.title}")
    private String title;
    @Value("${magic4j.swagger.description}")
    private String description;
    @Value("${magic4j.swagger.contact.name}")
    private String contactName;
    @Value("${magic4j.swagger.contact.url}")
    private String contactUrl;
    @Value("${magic4j.swagger.contact.email}")
    private String contactEmail;
    @Value("${magic4j.swagger.license.title}")
    private String licenseTitle;
    @Value("${magic4j.swagger.license.url}")
    private String licenseUrl;
    @Value("${magic4j.swagger.version}")
    private String version;

    List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        List<SecurityReference> securityReferences=new ArrayList<>();
        securityReferences.add(new SecurityReference("Authorization", authorizationScopes));
        return securityReferences;
    }

    /**
     * 在securitySchemes()方法配置里增加需要token的配置
     * @return
     */
    private List<ApiKey> securitySchemes() {
        List<ApiKey> apiKeyList= new ArrayList<>();
        apiKeyList.add(new ApiKey("Authorization", "Authorization", "header"));
        return apiKeyList;
    }

    private List<SecurityContext> securityContexts() {
        List<SecurityContext> securityContexts=new ArrayList<>();
        securityContexts.add(
                SecurityContext.builder()
                        .securityReferences(defaultAuth())
                        .build());
        return securityContexts;
    }

    /**
     * 公共API
     * @return
     */
    @Bean
    public Docket commApi() {

        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("通用API")
                .select()
                .apis(basePackage("com.itgacl.magic4j.libcommon"))
                //加了ApiOperation注解的类，才生成接口文档
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build()
                .securitySchemes(securitySchemes())//设置全局token,解决接口需要token验证的问题
                .securityContexts(securityContexts())
                .apiInfo(apiInfo());
    }

    /**
     * 后台管理系统接口API
     * @return
     */
    @Bean
    public Docket sysApi() {

        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("后台管理系统API")
                .select()
                //.apis(RequestHandlerSelectors.basePackage("com.itgacl.magic4j.modules.sys"))
                .apis(basePackage(
                        "com.itgacl.magic4j.modules.sys",
                        "com.itgacl.magic4j.modules.schedule",
                        "com.itgacl.magic4j.modules.tool"
                ))//配置多个要扫描的包路径
                //加了ApiOperation注解的类，才生成接口文档
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build()
                .securitySchemes(securitySchemes())//设置全局token,解决接口需要token验证的问题
                .securityContexts(securityContexts())
                .apiInfo(apiInfo());
    }

    /**
     * App接口API
     * @return
     */
    @Bean
    public Docket appApi() {

        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("App接口API")
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.itgacl.magic4j.modules.api"))
                //加了ApiOperation注解的类，才生成接口文档
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build()
                .securitySchemes(securitySchemes())//设置全局token,解决接口需要token验证的问题
                .securityContexts(securityContexts())
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title(title)
                .description(description)
                .contact(new Contact(contactName, contactUrl, contactEmail))
                .license(licenseTitle)
                .licenseUrl(licenseUrl)
                .version(version)
                .build();
    }

    /**
     * 使用springfox中的 RequestHandlerSelectors.basePackage("com.xxx") 只能支持单个包路径的扫描匹配
     * 所以要自定义basePackage方法来实现多包扫描，参考：https://zhuanlan.zhihu.com/p/59147622
     * @param basePackage
     * @return
     */
    public static Predicate<RequestHandler> basePackage(final String... basePackage) {
        return input -> declaringClass(input).map(handlerPackage(basePackage)).orElse(true);
    }

    private static Function<Class<?>, Boolean> handlerPackage(final String... basePackage)     {
        return input -> {
            // 循环判断匹配
            for (String strPackage : basePackage) {
                boolean isMatch = input.getPackage().getName().startsWith(strPackage);
                if (isMatch) {
                    return true;
                }
            }
            return false;
        };
    }

    private static Optional<Class<?>> declaringClass(RequestHandler input) {
        return Optional.ofNullable(input.declaringClass());
    }
}