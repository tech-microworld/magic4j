package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Classname SysAuthResourceDTO
 * @Description SysAuthResource的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-10
 * @Version 1.0
 */
@Data
public class SysAuthResourceDTO extends BaseDTO implements Serializable{

     private String controllerClassName;

     private String methodName;

     private String methodParam;

     private String requestUrl;

     private String requestTypes;

     private String permFlags;

     private String groupName;

     private LocalDateTime createTime;

     private LocalDateTime updateTime;


}
