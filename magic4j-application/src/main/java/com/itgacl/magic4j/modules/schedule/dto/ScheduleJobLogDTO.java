package com.itgacl.magic4j.modules.schedule.dto;
import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class ScheduleJobLogDTO extends BaseDTO implements Serializable{

     private Long jobId;

     private String jobName;

     private String beanName;

     private String methodName;

     private String params;

     private Integer status;

     private String error;

     private Integer times;

     private String serverIp;

     private LocalDateTime createTime;

     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @JSONField(serialize = false)//不序列化
     private Date endTime;
}
