package com.itgacl.magic4j.libcommon.bean;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 树形节点
 * @param <T>
 */
@Data
public class TreeNode<T,I> {

    @ApiModelProperty("ID")
    private I id;

    @ApiModelProperty("父ID")
    private I parentId;

    @ApiModelProperty("子节点")
    private List<T> children = new ArrayList<>();
}
