package com.itgacl.magic4j.libcommon.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标识controller类的方法请求参数是否进行加密
 * 方法需要加密加上对应注解即可实现
 */
@Target(value = ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Encrypt {

    Type value() default Type.NONE;

    enum Type {
        /**
         * 无
         */
        NONE,
        /**
         * AES加密
         */
        AES,
        /**
         * RSA加密
         */
        RSA
    }
}
