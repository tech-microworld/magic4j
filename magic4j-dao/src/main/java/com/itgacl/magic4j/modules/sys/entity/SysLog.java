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
 * 系统日志
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-04-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_log")
public class SysLog implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 日志类型(0:操作日志，1:登录日志)
     */
    private Integer logType;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 模块名
     */
    private String moduleName;

    /**
     * 操作
     */
    private String operation;

    /**
     * 类名
     */
    private String className;

    /**
     * 方法名
     */
    private String method;

    /**
     * 请求参数,json字符串
     */
    private String reqParam;

    /**
     * 执行时间(毫秒)
     */
    private Long executeTime;

    /**
     * 客户端IP
     */
    private String clientIp;

    /**
     * 客户端浏览器
     */
    private String clientBrowser;

    /**
     * 客户端操作系统
     */
    private String clientOperationSystem;

    /**
     * 客户端操作地点
     */
    private String clientOperationLocation;

    /**
     * 处理请求的服务器IP
     */
    private String handleServerIp;

    /**
     * 执行结果：0成功，1：失败
     */
    private Integer status;

    /**
     * 响应结果，json字符串
     */
    private String jsonResult;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 租户ID
     */
    private Long tenantId;


    public static final String ID = "id";

    public static final String LOG_TYPE = "log_type";

    public static final String USER_ID = "user_id";

    public static final String USERNAME = "username";

    public static final String MODULE_NAME = "module_name";

    public static final String OPERATION = "operation";

    public static final String CLASS_NAME = "class_name";

    public static final String METHOD = "method";

    public static final String REQ_PARAM = "req_param";

    public static final String EXECUTE_TIME = "execute_time";

    public static final String CLIENT_IP = "client_ip";

    public static final String CLIENT_BROWSER = "client_browser";

    public static final String CLIENT_OPERATION_SYSTEM = "client_operation_system";

    public static final String CLIENT_OPERATION_LOCATION = "client_operation_location";

    public static final String HANDLE_SERVER_IP = "handle_server_ip";

    public static final String STATUS = "status";

    public static final String JSON_RESULT = "json_result";

    public static final String REMARK = "remark";

    public static final String CREATE_TIME = "create_time";

    public static final String TENANT_ID = "tenant_id";

}
