package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.sys.dto.SysAuthResourceDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysAuthResource;
import com.itgacl.magic4j.modules.sys.mapper.SysAuthResourceMapper;
import com.itgacl.magic4j.modules.sys.service.SysAuthResourceService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SysAuthResourceServiceImpl
 * @Description SysAuthResourceService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-10
 * @Version 1.0
 */
@Service
public class SysAuthResourceServiceImpl extends ServiceImpl<SysAuthResourceMapper, SysAuthResource> implements SysAuthResourceService {

    @Override
    public void create(SysAuthResourceDTO sysAuthResourceDTO) {
        dataValidator.validate(sysAuthResourceDTO);//业务处理校验
        SysAuthResource sysAuthResource = new SysAuthResource();
        BeanUtils.copyProperties(sysAuthResourceDTO,sysAuthResource);
        save(sysAuthResource);//保存
    }

    @Override
    public void update(SysAuthResourceDTO sysAuthResourceDTO) {
        dataValidator.validate(sysAuthResourceDTO);//业务处理校验
        SysAuthResource sysAuthResource = new SysAuthResource();
        BeanUtils.copyProperties(sysAuthResourceDTO,sysAuthResource);
        updateById(sysAuthResource);
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
    public SysAuthResourceDTO getSysAuthResourceById(Long id) {
        SysAuthResource sysAuthResource = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysAuthResource);
        SysAuthResourceDTO sysAuthResourceDTO = new SysAuthResourceDTO();
        BeanUtils.copyProperties(sysAuthResource,sysAuthResourceDTO);
        return sysAuthResourceDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysAuthResourceDTO> getList(QueryWrapper queryWrapper) {
        List<SysAuthResourceDTO> sysAuthResourceDTOList = new ArrayList<>();
        List<SysAuthResource> sysAuthResourceList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysAuthResourceList)){
            sysAuthResourceList.forEach(sysAuthResource -> {
                SysAuthResourceDTO sysAuthResourceDTO = new SysAuthResourceDTO();
                BeanUtils.copyProperties(sysAuthResource,sysAuthResourceDTO);
                sysAuthResourceDTOList.add(sysAuthResourceDTO);
            });
        }
        return sysAuthResourceDTOList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysAuthResourceDTO> dataValidator = new DataValidator<SysAuthResourceDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysAuthResourceDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysAuthResourceDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysAuthResourceDTO data) {

        }
    };
}
