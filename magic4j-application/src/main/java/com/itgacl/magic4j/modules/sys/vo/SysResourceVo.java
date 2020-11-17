package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@ApiModel("系统资源Vo")
@Data
public class SysResourceVo extends TreeNode<SysResourceVo,Long> implements Serializable {

    @ApiModelProperty("资源名称")
    private String name;
    @ApiModelProperty("父资源名称")
    private String parentName;
    @ApiModelProperty("资源访问URL")
    private String url;
    @ApiModelProperty("资源图标")
    private String icon;
    @ApiModelProperty("资源访问权限标识")
    private String perms;
    @ApiModelProperty("资源类型")
    private Integer type;
    @ApiModelProperty("资源排序")
    private Integer orderNum;
    @ApiModelProperty("资源等级")
    private Integer level;
    @ApiModelProperty("资源备注")
    private String remark;
    @ApiModelProperty("资源请求方式")
    private String requestTypes;
    @ApiModelProperty("资源创建时间")
    private LocalDateTime createTime;

}
