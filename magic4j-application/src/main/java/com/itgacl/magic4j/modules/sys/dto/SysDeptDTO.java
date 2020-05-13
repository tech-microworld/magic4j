package com.itgacl.magic4j.modules.sys.dto;

import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysDeptDTO extends BaseDTO implements Serializable{

     private Long parentId;

     private String parentName;

     @NotBlank(message = "部门名称不能为空",groups = Constants.Create.class)
     private String deptName;

     private Integer orderNum;

     private String leader;

     private String phone;

     private String email;

     private Integer status;//部门状态（0正常 1停用）

}
