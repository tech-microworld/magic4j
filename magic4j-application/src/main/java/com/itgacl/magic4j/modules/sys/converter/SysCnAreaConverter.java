package com.itgacl.magic4j.modules.sys.converter;

import com.itgacl.magic4j.common.converter.BaseConverter;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.modules.sys.vo.AreaTreeVo;
import com.itgacl.magic4j.modules.sys.vo.SysCnAreaVo;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.vo.TreeSelectVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SysCnArea转换器
 * @Description Entity、VO、DTO相互转换器
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
public class SysCnAreaConverter extends BaseConverter<SysCnArea, SysCnAreaVo, SysCnAreaDTO> {

    public static SysCnAreaConverter build() {
        return new SysCnAreaConverter();
    }

    @Override
    public SysCnAreaVo vo(SysCnArea entity) {
        SysCnAreaVo SysCnAreaVo = new SysCnAreaVo();
        BeanUtils.copyProperties(entity,SysCnAreaVo);
        return SysCnAreaVo;
    }

    @Override
    public SysCnArea entity(SysCnAreaDTO entityDto) {
        SysCnArea SysCnArea = new SysCnArea();
        BeanUtils.copyProperties(entityDto,SysCnArea);
        return SysCnArea;
    }

    public AreaTreeVo treeVo(SysCnArea entity){
        AreaTreeVo areaTreeVo = new AreaTreeVo();
        BeanUtils.copyProperties(entity,areaTreeVo);
        areaTreeVo.setId(entity.getId());
        if(entity.getParentId() != null){
            areaTreeVo.setParentId(entity.getParentId());
        }
        return areaTreeVo;
    }

    public List<AreaTreeVo> treeListVo(List<SysCnArea> sysCnAreaList){
        List<AreaTreeVo> areaTreeVoList = new ArrayList<>();
        sysCnAreaList.forEach(cnArea -> areaTreeVoList.add(treeVo(cnArea)));
        return areaTreeVoList;
    }

    public TreeSelectVo treeSelectVo(AreaTreeVo areaTreeVo) {
        TreeSelectVo treeSelectVo = new TreeSelectVo();
        treeSelectVo.setId(areaTreeVo.getId());
        treeSelectVo.setLabel(areaTreeVo.getName());
        findChildren(treeSelectVo,areaTreeVo);
        return treeSelectVo;
    }

    public List<TreeSelectVo> treeSelectListVo(List<AreaTreeVo> areaTreeList) {
        List<AreaTreeVo> areaTreeVoList = TreeUtil.buildTree(areaTreeList);
        List<TreeSelectVo> treeSelectVos = new ArrayList<>();
        areaTreeVoList.forEach(areaTreeVo -> {
            TreeSelectVo treeSelectVo = treeSelectVo(areaTreeVo);
            treeSelectVos.add(treeSelectVo);
        });
        return treeSelectVos;
    }

    /**
     * 递归子节点
     */
    private void findChildren(TreeSelectVo treeSelectVo, AreaTreeVo treeNodeVo){
        List<TreeSelectVo> childrenVoList = new ArrayList<>();
        //子节点信息
        List<AreaTreeVo> subNodeList = treeNodeVo.getChildren();
        if(CollectionUtils.isNotEmpty(subNodeList)){
            //子节点信息不为空
            for(AreaTreeVo treeVo:subNodeList) {
                TreeSelectVo selectVo = new TreeSelectVo();
                selectVo.setId(treeVo.getId());
                selectVo.setLabel(treeVo.getName());
                childrenVoList.add(selectVo);
                findChildren(selectVo,treeVo);//递归
            }
        }
        treeSelectVo.setChildren(childrenVoList);
    }
}
