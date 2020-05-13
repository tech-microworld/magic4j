package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class SysResourceVo extends TreeNode<SysResourceVo,Long> implements Serializable {

    private String name;
    private String parentName;
    private String url;
    private String icon;
    private String perms;
    private Integer type;
    private Integer orderNum;
    private Integer level;
    private String remark;
    private String requestTypes;
    private LocalDateTime createTime;

}
