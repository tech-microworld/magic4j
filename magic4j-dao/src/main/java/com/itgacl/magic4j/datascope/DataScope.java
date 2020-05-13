package com.itgacl.magic4j.datascope;

import java.lang.annotation.*;

/**
 * 数据权限注解，标注在Mapper类的方法上
 *
 */
@Documented
@Target( value = { ElementType.TYPE, ElementType.METHOD } )
@Retention( RetentionPolicy.RUNTIME )
@Inherited
public @interface DataScope {

    /**
     * 限制范围的表字段名称
     */
    String tableFieldName() default "dept_id";
}
