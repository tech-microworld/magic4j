package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Classname DeptTreeVo
 * @Description 构建部门树vo
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 18:09
 * @Version 1.0
 */
@ApiModel("组织机构树")
@Data
public class DeptTreeVo extends TreeNode<DeptTreeVo,Long> implements Serializable {

    @ApiModelProperty(value = "机构名称")
    private String deptName;

    @ApiModelProperty(value = "显示顺序")
    private Integer orderNum;

    @ApiModelProperty(value = "负责人")
    private String leader;

    @ApiModelProperty(value = "负责人手机号")
    private String phone;

    @ApiModelProperty(value = "负责人邮箱")
    private String email;

    @ApiModelProperty(value = "状态（0正常 1停用）")
    private Integer status;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;
}
