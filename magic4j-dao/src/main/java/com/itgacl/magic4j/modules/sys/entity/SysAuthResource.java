package com.itgacl.magic4j.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统API资源(API接口)详细信息表
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-04-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_auth_resource")
public class SysAuthResource implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 控制器类名
     */
    private String controllerClassName;

    /**
     * 方法名
     */
    private String methodName;

    /**
     * 方法参数(json字符串)
     */
    private String methodParam;

    /**
     * 请求地址
     */
    private String requestUrl;

    /**
     * 请求方式
     */
    private String requestTypes;

    /**
     * 访问权限标识
     */
    private String permFlags;

    /**
     * 所属分组
     */
    private String groupName;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;


    public static final String ID = "id";

    public static final String CONTROLLER_CLASS_NAME = "controller_class_name";

    public static final String METHOD_NAME = "method_name";

    public static final String METHOD_PARAM = "method_param";

    public static final String REQUEST_URL = "request_url";

    public static final String REQUEST_TYPES = "request_types";

    public static final String PERM_FLAGS = "perm_flags";

    public static final String GROUP_NAME = "group_name";

    public static final String CREATE_TIME = "create_time";

    public static final String UPDATE_TIME = "update_time";

}
