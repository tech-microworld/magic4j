package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * TreeSelect树结构Vo
 *
 */
@Data
@NoArgsConstructor
public class TreeSelectVo extends TreeNode<TreeSelectVo,Long> implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("节点名称")
    private String label;

    public TreeSelectVo(DeptTreeVo deptTreeVo) {
        this.setId(deptTreeVo.getId());
        this.label = deptTreeVo.getDeptName();
        this.setChildren(deptTreeVo.getChildren().stream().map(TreeSelectVo::new).collect(Collectors.toList()));
    }

    public TreeSelectVo(SysResourceVo resourceVo) {
        this.setId(resourceVo.getId());
        this.label = resourceVo.getName();
        this.setChildren(resourceVo.getChildren().stream().map(TreeSelectVo::new).collect(Collectors.toList()));
    }

   /* public TreeSelectVo(AreaTreeVo areaTreeVo) {
        this.setId(areaTreeVo.getId());
        this.label = areaTreeVo.getName();
        this.setChildren(areaTreeVo.getChildren().stream().map(TreeSelectVo::new).collect(Collectors.toList()));
    }*/
}
