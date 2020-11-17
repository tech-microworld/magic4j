package com.itgacl.magic4j.modules.schedule.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@ApiModel("调度任务")
@Data
public class ScheduleJobDTO extends BaseDTO implements Serializable{

     @ApiModelProperty(value = "调度任务名称",required = true)
     @NotBlank(message = "请输入调度任务名称",groups = Constants.Create.class)
     private String jobName;

     @ApiModelProperty(value = "任务类名称")
     private String className;

     @ApiModelProperty(value = "调度任务对应的Bean名称",required = true)
     @NotBlank(message = "请输入调度任务对应的Bean名称",groups = Constants.Create.class)
     private String beanName;

     @ApiModelProperty(value = "调度任务要执行的方法",required = true)
     @NotBlank(message = "请填写调度任务要执行的方法",groups = Constants.Create.class)
     private String methodName;

     @ApiModelProperty(value = "调度任务要执行参数")
     private String params;

     @ApiModelProperty(value = "调度任务执行时间(cron表达式)",required = true)
     @NotBlank(message = "请填写调度任务执行时间",groups = Constants.Create.class)
     private String cronExpression;

     @ApiModelProperty(value = "调度任务状态")
     private Integer status;

     @ApiModelProperty(value = "调度任务备注")
     private String remark;

     @ApiModelProperty(value = "调度任务负责人")
     private String author;//负责人

     @ApiModelProperty(value = "调度任务负责人通知邮箱")
     private String alarmEmail;//报警邮箱

     @ApiModelProperty(value = "创建时间",hidden = true)
     private LocalDateTime createTime;

     @ApiModelProperty(hidden = true)
     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @ApiModelProperty(hidden = true)
     @JSONField(serialize = false)//不序列化
     private Date endTime;
}
