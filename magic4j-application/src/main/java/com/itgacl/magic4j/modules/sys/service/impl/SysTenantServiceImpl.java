package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.sys.dto.SysTenantDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysTenant;
import com.itgacl.magic4j.modules.sys.mapper.SysTenantMapper;
import com.itgacl.magic4j.modules.sys.service.SysTenantService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * SysTenantService 实现类
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
@Service
public class SysTenantServiceImpl extends ServiceImpl<SysTenantMapper, SysTenant> implements SysTenantService {

    @Override
    public void create(SysTenantDTO sysTenantDTO) {
        dataValidator.validate(sysTenantDTO);//业务处理校验
        SysTenant sysTenant = new SysTenant();
        BeanUtils.copyProperties(sysTenantDTO,sysTenant);
        save(sysTenant);//保存
    }

    @Override
    public void update(SysTenantDTO sysTenantDTO) {
        dataValidator.validate(sysTenantDTO);//业务处理校验
        SysTenant sysTenant = new SysTenant();
        BeanUtils.copyProperties(sysTenantDTO,sysTenant);
        updateById(sysTenant);
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
    public SysTenantDTO getSysTenantById(Long id) {
        SysTenant sysTenant = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysTenant);
        SysTenantDTO sysTenantDTO = new SysTenantDTO();
        BeanUtils.copyProperties(sysTenant,sysTenantDTO);
        return sysTenantDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysTenantDTO> getList(QueryWrapper queryWrapper) {
        List<SysTenantDTO> sysTenantDTOList = new ArrayList<>();
        List<SysTenant> sysTenantList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysTenantList)){
            sysTenantList.forEach(sysTenant -> {
                SysTenantDTO sysTenantDTO = new SysTenantDTO();
                BeanUtils.copyProperties(sysTenant,sysTenantDTO);
                sysTenantDTOList.add(sysTenantDTO);
            });
        }
        return sysTenantDTOList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysTenantDTO> dataValidator = new DataValidator<SysTenantDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysTenantDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysTenantDTO data) {
            Integer count = query().eq(SysTenant.NAME, data.getName()).count();
            AssertUtil.isTrue(ErrorCodeEnum.NAME_ALREADY_EXISTS,count == 0);//断言租户已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysTenantDTO data) {
            SysTenant sysTenant = query().eq(SysTenant.NAME, data.getName()).one();
            if(sysTenant != null){
                AssertUtil.equals(ErrorCodeEnum.NAME_ALREADY_EXISTS,data.getId(),sysTenant.getId());
            }
        }
    };
}
