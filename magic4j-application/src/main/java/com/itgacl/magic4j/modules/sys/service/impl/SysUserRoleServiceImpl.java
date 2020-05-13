package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysUserRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysUserRole;
import com.itgacl.magic4j.modules.sys.mapper.SysUserRoleMapper;
import com.itgacl.magic4j.modules.sys.service.SysUserRoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ISysUserRoleService的实现类
 * @author 孤傲苍狼
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

    @Override
    public void create(SysUserRoleDTO sysUserRoleDTO) {
        dataValidator.validate(sysUserRoleDTO);//业务处理校验
        SysUserRole sysUserRole = new SysUserRole();
        BeanUtils.copyProperties(sysUserRoleDTO,sysUserRole);
        save(sysUserRole);//保存
    }

    @Override
    public void update(SysUserRoleDTO sysUserRoleDTO) {
        dataValidator.validate(sysUserRoleDTO);//业务处理校验
        SysUserRole sysUserRole = new SysUserRole();
        BeanUtils.copyProperties(sysUserRoleDTO,sysUserRole);
        updateById(sysUserRole);
    }
 
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
    }

    @Override
    public void deleteByRoleId(Long roleId) {
        QueryWrapper<SysUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(SysUserRole.ROLE_ID,roleId);
        remove(queryWrapper);
    }

    @Override
    public void deleteByRoleIds(List<Long> roleIds) {
        QueryWrapper<SysUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(SysUserRole.ROLE_ID,roleIds);
        remove(queryWrapper);
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
    }

    @Override
    public SysUserRoleDTO getSysUserRoleById(Long id) {
        SysUserRole sysUserRole = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysUserRole);
        SysUserRoleDTO sysUserRoleDTO = new SysUserRoleDTO();
        BeanUtils.copyProperties(sysUserRole,sysUserRoleDTO);
        return sysUserRoleDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysUserRoleDTO> getList(QueryWrapper queryWrapper) {
        List<SysUserRoleDTO> sysUserRoleDTOList = new ArrayList<>();
        List<SysUserRole> sysUserRoleList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysUserRoleList)){
            sysUserRoleList.forEach(sysUserRole -> {
                SysUserRoleDTO sysUserRoleDTO = new SysUserRoleDTO();
                BeanUtils.copyProperties(sysUserRole,sysUserRoleDTO);
                sysUserRoleDTOList.add(sysUserRoleDTO);
            });
        }
        return sysUserRoleDTOList;
    }

    @Override
    public void bindRole(Long sysUserId, List<Long> roleIds) {
        //先根据用户ID删除绑定的旧角色
        QueryWrapper<SysUserRole> wrapper = new QueryWrapper<>();
        wrapper.eq(SysUserRole.USER_ID,sysUserId);
        remove(wrapper);
        List<SysUserRole> sysUserRoleList = new ArrayList<>();
        roleIds.forEach(roleId->{
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(sysUserId);
            sysUserRole.setRoleId(roleId);
            sysUserRoleList.add(sysUserRole);
        });
        saveBatch(sysUserRoleList);//批量保存
    }

    @Override
    public List<SysUserRole> findByUserId(Long sysUserId) {
        return query().eq(SysUserRole.USER_ID,sysUserId).list();
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysUserRoleDTO> dataValidator = new DataValidator<SysUserRoleDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysUserRoleDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysUserRoleDTO data) {
            Integer count = query().eq(SysUserRole.ROLE_ID, data.getRoleId()).eq(SysUserRole.USER_ID, data.getUserId()).count();
            AssertUtil.isTrue(ErrorCodeEnum.DATA_EXIST,count == 0);//断言已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysUserRoleDTO data) {

        }
    };
}
