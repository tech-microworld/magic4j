package com.itgacl.magic4j.modules.schedule.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class ScheduleJobDTO extends BaseDTO implements Serializable{

     @NotBlank(message = "请输入调度任务名称",groups = Constants.Create.class)
     private String jobName;

     private String className;

     @NotBlank(message = "请输入调度任务对应的Bean名称",groups = Constants.Create.class)
     private String beanName;

     @NotBlank(message = "请填写定时任务要执行的方法",groups = Constants.Create.class)
     private String methodName;

     private String params;

     @NotNull(message = "请填写定时任务执行时间",groups = Constants.Create.class)
     private String cronExpression;

     private Integer status;

     private String remark;

     private String author;//负责人

     private String alarmEmail;//报警邮箱

     private LocalDateTime createTime;

     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @JSONField(serialize = false)//不序列化
     private Date endTime;
}
