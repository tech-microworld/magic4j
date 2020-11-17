package com.itgacl.magic4j.modules.sys.dto;

import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@ApiModel("系统资源DTO")
@Data
public class SysResourceDTO extends BaseDTO implements Serializable{

     @NotNull(message = "资源名称不能为空!",groups = Constants.Create.class)//字段为空会抛出MethodArgumentNotValidException异常
     private String name;

     private Long parentId;

     private String parentName;

     private String url;

     private String icon;

     private String perms;

     @NotNull(message = "资源类型不能为空!",groups = Constants.Create.class)
     private Integer type;

     private Integer orderNum;

     private Integer level;

     private String remark;
}
