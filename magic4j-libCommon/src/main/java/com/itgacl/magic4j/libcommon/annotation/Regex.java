package com.itgacl.magic4j.libcommon.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 正则表达式验证注解
 * @anthor 孤傲苍狼
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Regex {
    String[] value();
    String[] regex() ;//正则表达式
    String[] message() default "";
}
