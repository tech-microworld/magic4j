package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;

import java.util.List;

/**
 * SysRoleService
 * @author 孤傲苍狼
 */
public interface SysRoleService extends IService<SysRole> {

    Long create(SysRoleDTO sysRoleDTO);

    void update(SysRoleDTO sysRoleDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysRoleDTO getSysRoleById(Long id);

    void deleteAll();

    List<SysRoleDTO> getList(QueryWrapper<SysRole> queryWrapper);

    void bindResource(Long id, List<Long> resIds);

    List<SysRole> getUserRoleList(Long sysUserId);

    List<SysResourceVo> getRoleResList(Long roleId,Integer resType);
}
