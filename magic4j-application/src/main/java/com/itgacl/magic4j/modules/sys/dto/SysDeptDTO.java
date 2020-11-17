package com.itgacl.magic4j.modules.sys.dto;

import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@ApiModel("组织机构DTO")
@Data
public class SysDeptDTO extends BaseDTO implements Serializable{

     @ApiModelProperty(value = "上级机构ID")
     private Long parentId;

     @ApiModelProperty(value = "上级机构名称")
     private String parentName;

     @ApiModelProperty(value = "机构名称",required = true)
     @NotBlank(message = "部门名称不能为空",groups = Constants.Create.class)
     private String deptName;

     @ApiModelProperty(value = "显示顺序")
     private Integer orderNum;

     @ApiModelProperty(value = "负责人")
     private String leader;

     @ApiModelProperty(value = "负责人手机号")
     @Pattern(regexp = "^[1][3,4,5,6,7,8,9][0-9]{9}$", message = "手机号格式有误",groups = {Constants.Create.class, Constants.Update.class})
     private String phone;

     @ApiModelProperty(value = "负责人邮箱")
     @Email(message = "邮箱格式不对",groups = {Constants.Create.class, Constants.Update.class})
     private String email;

     @ApiModelProperty(value = "状态（0正常 1停用）")
     @Range(min=0, max=1)
     private Integer status;//部门状态（0正常 1停用）

}
