package com.itgacl.magic4j.libcommon.annotation;

import org.springframework.core.annotation.Order;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *  用于标记该方法需要写入日志，需要在各项目中实现注解解析（aop)
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Order(1)
public @interface Log {

    /**模块*/
    String moduleName() default "";

    /**
     * 操作
     * @return
     */
    String operation() default "";

    /**
     * 操作描述
     * @return
     */
    String remark() default "";

    /**
     * 日志类型（0：操作日志，1：登录日志）
     */
    int logType()  default 0 ;

    /**
     * 是否保存请求的参数
     */
    boolean isSaveReqData() default true;

    /**
     * 是否保存响应数据
     */
    boolean isSaveResData() default true;
}
