package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDeptDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysRoleDept;
import com.itgacl.magic4j.modules.sys.entity.SysUserRole;
import com.itgacl.magic4j.modules.sys.mapper.SysRoleDeptMapper;
import com.itgacl.magic4j.modules.sys.service.SysRoleDeptService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * SysRoleDeptService 实现类
 * @author 孤傲苍狼
 * @since 2020-04-03
 */
@Service
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptMapper, SysRoleDept> implements SysRoleDeptService {

    @Override
    public void create(SysRoleDeptDTO sysRoleDeptDTO) {
        dataValidator.validate(sysRoleDeptDTO);//业务处理校验
        SysRoleDept sysRoleDept = new SysRoleDept();
        BeanUtils.copyProperties(sysRoleDeptDTO,sysRoleDept);
        save(sysRoleDept);//保存
    }

    @Override
    public void update(SysRoleDeptDTO sysRoleDeptDTO) {
        dataValidator.validate(sysRoleDeptDTO);//业务处理校验
        SysRoleDept sysRoleDept = new SysRoleDept();
        BeanUtils.copyProperties(sysRoleDeptDTO,sysRoleDept);
        updateById(sysRoleDept);
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
    public SysRoleDeptDTO getSysRoleDeptById(Long id) {
        SysRoleDept sysRoleDept = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysRoleDept);
        SysRoleDeptDTO sysRoleDeptDTO = new SysRoleDeptDTO();
        BeanUtils.copyProperties(sysRoleDept,sysRoleDeptDTO);
        return sysRoleDeptDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysRoleDeptDTO> getList(QueryWrapper queryWrapper) {
        List<SysRoleDeptDTO> sysRoleDeptDTOList = new ArrayList<>();
        List<SysRoleDept> sysRoleDeptList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysRoleDeptList)){
            sysRoleDeptList.forEach(sysRoleDept -> {
                SysRoleDeptDTO sysRoleDeptDTO = new SysRoleDeptDTO();
                BeanUtils.copyProperties(sysRoleDept,sysRoleDeptDTO);
                sysRoleDeptDTOList.add(sysRoleDeptDTO);
            });
        }
        return sysRoleDeptDTOList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysRoleDeptDTO> dataValidator = new DataValidator<SysRoleDeptDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysRoleDeptDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysRoleDeptDTO data) {
            Integer count = query().eq(SysRoleDept.ROLE_ID, data.getRoleId()).eq(SysRoleDept.DEPT_ID, data.getDeptId()).count();
            AssertUtil.isTrue(ErrorCodeEnum.DATA_EXIST,count == 0);//断言已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysRoleDeptDTO data) {

        }
    };
}
