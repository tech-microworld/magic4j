package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.datascope.strategy.DataScopeContext;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.*;
import com.itgacl.magic4j.modules.sys.mapper.SysRoleMapper;
import com.itgacl.magic4j.modules.sys.service.*;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * SysRoleService的实现类
 * @author 孤傲苍狼
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

    @Autowired
    private SysRoleResourceService roleResourceService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private DataScopeContext dataScopeContext;

    @Autowired
    private SysRoleDeptService sysRoleDeptService;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Transactional
    @Override
    public Long create(SysRoleDTO sysRoleDTO) {
        dataValidator.validate(sysRoleDTO);//业务处理校验
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(sysRoleDTO,sysRole);
        save(sysRole);//保存
        List<Long> roleResId = new ArrayList<>();
        if(ArrayUtil.isNotEmpty(sysRoleDTO.getMenuIds())){
            roleResId.addAll(Arrays.asList(sysRoleDTO.getMenuIds()));
        }
        if(ArrayUtil.isNotEmpty(sysRoleDTO.getAuthResIds())){
            roleResId.addAll(Arrays.asList(sysRoleDTO.getAuthResIds()));
        }
        if (CollectionUtil.isNotEmpty(roleResId)) {
            bindResource(sysRole.getId(), roleResId);
        }
        // 维护角色部门权限，根据数据权限范围查询部门ids
        List<Long> deptIds = dataScopeContext.getDeptIdsForDataScope(sysRoleDTO, sysRoleDTO.getDataScope());
        saveRoleDept(sysRole.getId(),deptIds);
        return sysRole.getId();//保存成功后返回主键id
    }

    @Transactional
    @Override
    public void update(SysRoleDTO sysRoleDTO) {
        dataValidator.validate(sysRoleDTO);//业务处理校验
        SysRole sysRole = new SysRole();
        BeanUtils.copyProperties(sysRoleDTO, sysRole);
        updateById(sysRole);
        boolean isUpdateRoleRes = false;//是否需要更新角色资源
        List<Long> roleResId = new ArrayList<>();
        if(sysRoleDTO.getMenuIds() != null){
            isUpdateRoleRes = true;
            roleResId.addAll(Arrays.asList(sysRoleDTO.getMenuIds()));
        }
        if(sysRoleDTO.getAuthResIds() != null){
            isUpdateRoleRes = true;
            roleResId.addAll(Arrays.asList(sysRoleDTO.getAuthResIds()));
        }
        if(isUpdateRoleRes){
            bindResource(sysRole.getId(), roleResId);
        }
        // 维护角色部门权限，根据数据权限范围查询部门ids
        List<Long> deptIds = dataScopeContext.getDeptIdsForDataScope(sysRoleDTO, sysRoleDTO.getDataScope());
        saveRoleDept(sysRole.getId(),deptIds);
    }

    private void saveRoleDept(Long roleId, List<Long> deptIds){
        if (CollectionUtil.isNotEmpty(deptIds)) {
            List<SysRoleDept> roleDeptList = deptIds.stream().map(deptId -> {
                SysRoleDept sysRoleDept = new SysRoleDept();
                sysRoleDept.setDeptId(deptId);
                sysRoleDept.setRoleId(roleId);
                return sysRoleDept;
            }).collect(Collectors.toList());
            //先删除已经存在的旧数据
            QueryWrapper<SysRoleDept> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq(SysRoleDept.ROLE_ID,roleId);
            sysRoleDeptService.remove(queryWrapper);
            sysRoleDeptService.saveBatch(roleDeptList);
        }
    }

    @Transactional
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
        roleResourceService.deleteByRoleId(id);//删除角色绑定的资源
        sysUserRoleService.deleteByRoleId(id);//删除用户绑定的角色
    }

    @Transactional
    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
        QueryWrapper<SysRoleResource> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(SysRoleResource.ROLE_ID,idList);
        roleResourceService.remove(queryWrapper);
        sysUserRoleService.deleteByRoleIds(idList);//删除用户绑定的角色
    }

    @Override
    public SysRoleDTO getSysRoleById(Long id) {
        SysRole sysRole = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysRole);
        SysRoleDTO sysRoleDTO = new SysRoleDTO();
        BeanUtils.copyProperties(sysRole,sysRoleDTO);
        return sysRoleDTO;
    }

    @Transactional
    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
        roleResourceService.remove(null);
    }

    @Override
    public List<SysRoleDTO> getList(QueryWrapper<SysRole> queryWrapper) {
        List<SysRoleDTO> sysRoleDTOList = new ArrayList<>();
        List<SysRole> sysRoleList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysRoleList)){
            sysRoleList.forEach(sysRole -> {
                SysRoleDTO sysRoleDTO = new SysRoleDTO();
                BeanUtils.copyProperties(sysRole,sysRoleDTO);
                sysRoleDTOList.add(sysRoleDTO);
            });
        }
        return sysRoleDTOList;
    }

    /**
     *
     * 为角色绑定资源
     * @param id
     * @param resIds
     */
    @Override
    public void bindResource(Long id,List<Long> resIds) {
        roleResourceService.deleteByRoleId(id);//先删除旧的资源
        List<SysRoleResource> sysRoleResourceList = new ArrayList<>();
        resIds.forEach(resId->{
            SysRoleResource sysRoleResource = new SysRoleResource();
            sysRoleResource.setResourceId(resId);
            sysRoleResource.setRoleId(id);
            sysRoleResourceList.add(sysRoleResource);
        });
        roleResourceService.saveBatch(sysRoleResourceList);
    }

    /**
     * 获取用户的角色列表
     * @param sysUserId
     * @return
     */
    @Override
    public List<SysRole> getUserRoleList(Long sysUserId) {
        List<SysRole> roleList = sysRoleMapper.getUserRoleList(sysUserId);
       /* List<SysUserRole> sysUserRoles = sysUserRoleService.findByUserId(sysUserId);
        if(CollectionUtils.isNotEmpty(sysUserRoles)){
            List<Long> roleIds = new ArrayList<>();
            sysUserRoles.forEach(item-> roleIds.add(item.getRoleId()));
            roleList = query().in(SysRole.ID,roleIds).list();
        }*/
        return roleList;
    }

    /**
     * 获取角色所拥有的资源列表
     * @param roleId
     * @param resType 资源类型（0：系统API 1：菜单   2：按钮）
     * @return
     */
    @Override
    public List<SysResourceVo> getRoleResList(Long roleId,Integer resType) {
        List<SysResourceVo> resourceVoList = new ArrayList<>();
        List<SysRoleResource> roleResourceList = roleResourceService.findByRoleId(roleId);
        if(CollectionUtils.isNotEmpty(roleResourceList)){
            List<Long> resIds = new ArrayList<>();
            roleResourceList.forEach(item-> resIds.add(item.getResourceId()));
            List<SysResource> sysResourceList;
            if(resType == null){
                sysResourceList = sysResourceService.getByIdList(resIds);
            }else {
                sysResourceList = sysResourceService.getByTypeAndIdList(resType,resIds);
            }
            sysResourceList.forEach(sysResource -> {
                SysResourceVo resourceVo = new SysResourceVo();
                BeanUtils.copyProperties(sysResource,resourceVo);
                resourceVo.setId(sysResource.getId());
                if(sysResource.getParentId() != null){
                    resourceVo.setParentId(sysResource.getParentId());
                }
                resourceVoList.add(resourceVo);
            });
        }
        return resourceVoList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysRoleDTO> dataValidator = new DataValidator<SysRoleDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysRoleDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysRoleDTO data) {
            //根据角色名称或者角色标识进行查询
            int count  = query().eq(SysRole.ROLE_NAME,data.getRoleName()).or().eq(SysRole.ROLE_CODE,data.getRoleCode()).count();
            AssertUtil.isTrue(ErrorCodeEnum.ROLE_ALREADY_EXISTS,count == 0);//断言角色已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysRoleDTO data) {
            SysRole sysRole = query().eq(SysRole.ROLE_NAME,data.getRoleName()).one();
            if(sysRole != null){
                AssertUtil.equals(ErrorCodeEnum.ROLE_ALREADY_EXISTS,data.getId(),sysRole.getId());
            }
            sysRole = query().eq(SysRole.ROLE_CODE,data.getRoleCode()).one();
            if(sysRole != null){
                AssertUtil.equals(ErrorCodeEnum.ROLE_ALREADY_EXISTS,data.getId(),sysRole.getId());
            }
        }
    };
}
