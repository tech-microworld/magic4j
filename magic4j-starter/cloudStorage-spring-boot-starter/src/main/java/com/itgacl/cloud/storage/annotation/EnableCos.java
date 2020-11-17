package com.itgacl.cloud.storage.annotation;

import java.lang.annotation.*;

/**
 * 是否启用COS配置注解，标注在Springboot项目启动类上，如果没有标注，则配置不生效
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface EnableCos {

}
