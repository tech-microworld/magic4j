package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysRoleResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRoleResource;
import com.itgacl.magic4j.modules.sys.mapper.SysRoleResourceMapper;
import com.itgacl.magic4j.modules.sys.service.SysRoleResourceService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ISysRoleResourceService的实现类
 * @author 孤傲苍狼
 */
@Service
public class SysRoleResourceServiceImpl extends ServiceImpl<SysRoleResourceMapper, SysRoleResource> implements SysRoleResourceService {

    @Override
    public void create(SysRoleResourceDTO sysRoleResourceDTO) {
        dataValidator.validate(sysRoleResourceDTO);//业务处理校验
        SysRoleResource sysRoleResource = new SysRoleResource();
        BeanUtils.copyProperties(sysRoleResourceDTO,sysRoleResource);
        save(sysRoleResource);//保存
    }

    @Override
    public void update(SysRoleResourceDTO sysRoleResourceDTO) {
        dataValidator.validate(sysRoleResourceDTO);//业务处理校验
        SysRoleResource sysRoleResource = new SysRoleResource();
        BeanUtils.copyProperties(sysRoleResourceDTO,sysRoleResource);
        updateById(sysRoleResource);
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
    public SysRoleResourceDTO getSysRoleResourceById(Long id) {
        SysRoleResource sysRoleResource = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysRoleResource);
        SysRoleResourceDTO sysRoleResourceDTO = new SysRoleResourceDTO();
        BeanUtils.copyProperties(sysRoleResource,sysRoleResourceDTO);
        return sysRoleResourceDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysRoleResourceDTO> getList(QueryWrapper queryWrapper) {
        List<SysRoleResourceDTO> sysRoleResourceDTOList = new ArrayList<>();
        List<SysRoleResource> sysRoleResourceList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysRoleResourceList)){
            sysRoleResourceList.forEach(sysRoleResource -> {
                SysRoleResourceDTO sysRoleResourceDTO = new SysRoleResourceDTO();
                BeanUtils.copyProperties(sysRoleResource,sysRoleResourceDTO);
                sysRoleResourceDTOList.add(sysRoleResourceDTO);
            });
        }
        return sysRoleResourceDTOList;
    }

    @Override
    public void deleteByRoleId(Long roleId) {
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put(SysRoleResource.ROLE_ID,roleId);
        removeByMap(paramMap);//通过角色ID删除
    }

    @Override
    public List<SysRoleResource> findByRoleId(Long roleId) {
        return query().eq(SysRoleResource.ROLE_ID,roleId).list();
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysRoleResourceDTO> dataValidator = new DataValidator<SysRoleResourceDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysRoleResourceDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysRoleResourceDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysRoleResourceDTO data) {

        }
    };
}
