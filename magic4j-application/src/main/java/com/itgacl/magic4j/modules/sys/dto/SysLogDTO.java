package com.itgacl.magic4j.modules.sys.dto;
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
public class SysLogDTO extends BaseDTO implements Serializable{

     private Integer logType;

     private Long userId;

     private String username;

     private String roleNames;

     private String moduleName;

     private String operation;

     private String className;

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
      * 执行结果：0成功，1：失败
      */
     private Integer status;

     private String clientIp;

     private String clientBrowser;

     private String clientOperationSystem;

     /**
      * 客户端操作地点
      */
     private String clientOperationLocation;

     /**
      * 处理请求的服务器IP
      */
     private String handleServerIp;

     private Integer result;

     private String remark;

     private LocalDateTime createTime;

     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @JSONField(serialize = false)//不序列化
     private Date endTime;

}
