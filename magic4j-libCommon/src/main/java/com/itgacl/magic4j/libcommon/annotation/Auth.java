package com.itgacl.magic4j.libcommon.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Auth注解用于权限控制，可以用于class或者method
 *
 */
@Target(value = {ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Auth {

    String requiresPermission() default ""; //访问权限

    String name() default "";

    String moduleName() default "默认"; //模块

    boolean isAuth() default true;//需要鉴定是否包含权限
}
