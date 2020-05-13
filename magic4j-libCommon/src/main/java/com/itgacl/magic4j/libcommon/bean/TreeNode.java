package com.itgacl.magic4j.libcommon.bean;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 树形节点
 * @param <T>
 */
@Data
public class TreeNode<T,I> {

    private I id;
    private I parentId;
    private List<T> children = new ArrayList<>();//子节点
}
