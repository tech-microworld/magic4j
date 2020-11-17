package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysUserRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysUserRole;

import java.util.List;

/**
 * SysUserRoleService
 * @author 孤傲苍狼
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    void create(SysUserRoleDTO sysUserRoleDTO);

    void update(SysUserRoleDTO sysUserRoleDTO);
 
    void deleteById(Long id);

    void deleteByRoleId(Long roleId);

    void deleteByRoleIds(List<Long> roleIds);

    void deleteByIds(List<Long> idList);

    SysUserRoleDTO getSysUserRoleById(Long id);

    void deleteAll();

    List<SysUserRoleDTO> getList(QueryWrapper queryWrapper);

    void bindRole(Long sysUserId, List<Long> roleIds);

    List<SysUserRole> findByUserId(Long sysUserId);

    String getUserRoleNames(Long sysUserId);
}
