package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.modules.sys.mapper.SysCnAreaMapper;
import com.itgacl.magic4j.modules.sys.service.SysCnAreaService;
import com.itgacl.magic4j.modules.sys.vo.AreaVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * SysCnAreaService的实现类
 * @author 孤傲苍狼
 */
@Service
public class SysCnAreaServiceImpl extends ServiceImpl<SysCnAreaMapper, SysCnArea> implements SysCnAreaService {

    @Override
    public void create(SysCnAreaDTO sysCnAreaDTO) {
        dataValidator.validate(sysCnAreaDTO);//业务处理校验
        SysCnArea sysCnArea = new SysCnArea();
        BeanUtils.copyProperties(sysCnAreaDTO,sysCnArea);
        save(sysCnArea);//保存
    }

    @Override
    public void update(SysCnAreaDTO sysCnAreaDTO) {
        dataValidator.validate(sysCnAreaDTO);//业务处理校验
        SysCnArea sysCnArea = new SysCnArea();
        BeanUtils.copyProperties(sysCnAreaDTO,sysCnArea);
        updateById(sysCnArea);
    }
 
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
    }

    @Override
    public SysCnAreaDTO getSysCnAreaById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        SysCnAreaDTO sysCnAreaDTO = new SysCnAreaDTO();
        BeanUtils.copyProperties(sysCnArea,sysCnAreaDTO);
        return sysCnAreaDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysCnAreaDTO> getList(QueryWrapper queryWrapper) {
        List<SysCnAreaDTO> sysCnAreaDTOList = new ArrayList<>();
        List<SysCnArea> sysCnAreaList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysCnAreaList)){
            sysCnAreaList.forEach(sysCnArea -> {
                SysCnAreaDTO sysCnAreaDTO = new SysCnAreaDTO();
                BeanUtils.copyProperties(sysCnArea,sysCnAreaDTO);
                sysCnAreaDTOList.add(sysCnAreaDTO);
            });
        }
        return sysCnAreaDTOList;
    }

    @Override
    public List<AreaVo> geAreaTreeList() {
        List<SysCnArea> cnAreaList = list();
        List<AreaVo> areaVoList = new ArrayList<>();
        for(SysCnArea cnArea:cnAreaList){
            AreaVo areaVo = new AreaVo();
            BeanUtils.copyProperties(cnArea,areaVo);
            areaVo.setId(cnArea.getId());
            if(cnArea.getParentId() != null){
                areaVo.setParentId(cnArea.getParentId());
            }
            areaVoList.add(areaVo);
        }
        return areaVoList;
    }

    @Override
    public List<AreaVo> geAreaTreeListById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        AreaVo areaVo = new AreaVo();
        BeanUtils.copyProperties(sysCnArea,areaVo);
        areaVo.setId(sysCnArea.getId());
        if(sysCnArea.getParentId() != null){
            areaVo.setParentId(sysCnArea.getParentId());
        }
        List<AreaVo> areaVoList = new ArrayList<>();
        areaVoList.add(areaVo);
        recursionQuerySubArea(areaVoList,areaVo.getId());//递归查询子区域
        return areaVoList;
    }

    @Override
    public AreaVo getAreaTreeById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        AreaVo areaVo = new AreaVo();
        BeanUtils.copyProperties(sysCnArea,areaVo);
        areaVo.setId(sysCnArea.getId());
        if(sysCnArea.getParentId() != null){
            areaVo.setParentId(sysCnArea.getParentId());
        }
        recursionQuerySubArea(areaVo);//递归查询子资源
        return areaVo;
    }

    /**
     * 递归查询子区域
     */
    private void recursionQuerySubArea(AreaVo areaVo){
        Long id = areaVo.getId();
        //根据parentId查询
        List<AreaVo> childrenVoList = new ArrayList<>();
        //查找子资源信息
        List<SysCnArea> subAreaList = query().eq(SysCnArea.PARENT_ID,id).list();
        if(CollectionUtils.isNotEmpty(subAreaList)){
            //子节点信息不为空
            for(SysCnArea sysCnArea:subAreaList) {
                AreaVo subAreaVo = new AreaVo();
                BeanUtils.copyProperties(sysCnArea, subAreaVo);
                subAreaVo.setId(sysCnArea.getId());
                if(sysCnArea.getParentId() != null){
                    subAreaVo.setParentId(sysCnArea.getParentId());
                }
                childrenVoList.add(subAreaVo);
            }
            for(AreaVo resourceVo:childrenVoList){
                //递归查询
                recursionQuerySubArea(resourceVo);
            }
        }
        areaVo.setChildren(childrenVoList);
    }

    private void recursionQuerySubArea(List<AreaVo> voList,Long areaId){
        //根据parentId查询子区域信息
        List<SysCnArea> subAreaList = query().eq(SysCnArea.PARENT_ID,areaId).list();
        if(CollectionUtils.isNotEmpty(subAreaList)){
            List<AreaVo> childrenVoList = new ArrayList<>();
            //子节点信息不为空
            for(SysCnArea sysCnArea:subAreaList) {
                AreaVo subAreaVo = new AreaVo();
                BeanUtils.copyProperties(sysCnArea, subAreaVo);
                subAreaVo.setId(sysCnArea.getId());
                if(sysCnArea.getParentId() != null){
                    subAreaVo.setParentId(sysCnArea.getParentId());
                }
                childrenVoList.add(subAreaVo);
            }
            voList.addAll(childrenVoList);
            for(AreaVo resourceVo:childrenVoList){
                List<AreaVo> childrenList = new ArrayList<>();
                //递归查询
                recursionQuerySubArea(childrenList,resourceVo.getId());
                voList.addAll(childrenList);
            }
        }
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysCnAreaDTO> dataValidator = new DataValidator<SysCnAreaDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysCnAreaDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysCnAreaDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysCnAreaDTO data) {

        }
    };
}
