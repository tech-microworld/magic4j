package com.itgacl.magic4j.modules.schedule.entity;

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
 * 定时任务执行日志
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-04-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("schedule_job_log")
public class ScheduleJobLog implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 日志ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 任务ID
     */
    private Long jobId;

    /**
     * 任务名称
     */
    private String jobName;

    /**
     * bean名称
     */
    private String beanName;

    /**
     * 方法名称
     */
    private String methodName;

    /**
     * 执行参数
     */
    private String params;

    /**
     * 任务执行结果    0：成功    1：失败
     */
    private Integer status;

    /**
     * 错误信息
     */
    private String error;

    /**
     * 执行耗时
     */
    private Integer times;

    /**
     * 执行定时任务的服务器IP
     */
    private String serverIp;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;


    public static final String ID = "id";

    public static final String JOB_ID = "job_id";

    public static final String JOB_NAME = "job_name";

    public static final String BEAN_NAME = "bean_name";

    public static final String METHOD_NAME = "method_name";

    public static final String PARAMS = "params";

    public static final String STATUS = "status";

    public static final String ERROR = "error";

    public static final String TIMES = "times";

    public static final String SERVER_IP = "server_ip";

    public static final String CREATE_TIME = "create_time";

}
