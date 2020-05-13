package com.itgacl.magic4j.libcommon.component.resolver;

import java.lang.annotation.*;

/**
 * 配合Magic4jMethodArgumentResolver一起使用，
 * 可以使得Controller的方法同时支持form提交和json提交
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FormOrJson {

}
