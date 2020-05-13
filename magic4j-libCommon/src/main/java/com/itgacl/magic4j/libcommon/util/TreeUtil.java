package com.itgacl.magic4j.libcommon.util;


import com.itgacl.magic4j.libcommon.bean.TreeNode;

import java.util.*;

public class TreeUtil {

    /**
     * 生成tree
     * @param list
     * @return
     */
    public static <T extends TreeNode> List<T> buildTree(List<T> list) {
        Map<Object, T> dtoMap = new LinkedHashMap<>();//有序Map
        for (T node : list) {
            dtoMap.put(node.getId(), node);
        }
        List<T> resultList = new ArrayList<>();
        for (Map.Entry<Object, T> entry : dtoMap.entrySet()) {
            T node = entry.getValue();
            if (node.getParentId() == null) {
                // 如果是顶层节点，直接添加到结果集合中
                resultList.add(node);
            } else {
                // 如果不是顶层节点，找其父节点，并且添加到父节点的子节点集合中
                if (dtoMap.get(node.getParentId()) != null) {
                    dtoMap.get(node.getParentId()).getChildren().add(node);
                }else {
                    resultList.add(node);//如果找不到的父节点，就将自身添加到结果集中
                }
            }
        }
        return resultList;
    }

    /**
     * 递归查找子节点
     *
     * @param treeNodes
     * @return
     */
    public static <T extends TreeNode> T findChildren(T treeNode, List<T> treeNodes) {
        treeNodes.stream().filter(e -> Objects.equals(treeNode.getId(), e.getParentId())).forEach(e -> treeNode.getChildren().add(findChildren(e, treeNodes)));
        return treeNode;
    }
}
