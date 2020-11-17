package com.itgacl.magic4j.modules.sys.dto;

import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @Classname SysPostDTO
 * @Description SysPost的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
@ApiModel("岗位DTO")
@Data
public class SysPostDTO extends BaseDTO implements Serializable{

     @ApiModelProperty(value = "岗位名称")
     @NotBlank(message = "请填写岗位名称",groups = Constants.Create.class)
     private String postName;

     @ApiModelProperty(value = "岗位编码")
     @NotBlank(message = "请填写岗位编码",groups = Constants.Create.class)
     private String postCode;

     @ApiModelProperty(value = "显示顺序")
     private Integer orderNum;

     @ApiModelProperty(value = "岗位状态（0正常 1停用）")
     @NotNull(message = "请选择岗位状态",groups = Constants.Create.class)
     private Integer status; //状态（0正常 1停用）;

     @ApiModelProperty(value = "岗位备注")
     private String remark;

     @ApiModelProperty(hidden = true)
     private Long[] postIds;

     @ApiModelProperty(value = "岗位分类：1：高层，2：中层，3：基层，4：其他")
     @NotNull(message = "请选择岗位分类",groups = Constants.Create.class)
     private Integer postCategory;

     @ApiModelProperty(hidden = true)
     private String[] exportColumnNames;

}
