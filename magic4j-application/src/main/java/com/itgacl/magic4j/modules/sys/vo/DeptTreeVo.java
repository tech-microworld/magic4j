package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
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
@Data
public class DeptTreeVo extends TreeNode<DeptTreeVo,Long> implements Serializable {

    private String deptName;

    private Integer orderNum;

    private String leader;

    private String phone;

    private String email;

    private Integer status;

    private LocalDateTime createTime;
}
