package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysRoleResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRoleResource;

import java.util.List;

/**
 * SysRoleResourceService
 * @author 孤傲苍狼
 */
public interface SysRoleResourceService extends IService<SysRoleResource> {

    void create(SysRoleResourceDTO sysRoleResourceDTO);

    void update(SysRoleResourceDTO sysRoleResourceDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysRoleResourceDTO getSysRoleResourceById(Long id);

    void deleteAll();

    List<SysRoleResourceDTO> getList(QueryWrapper queryWrapper);

    void deleteByRoleId(Long roleId);

    List<SysRoleResource> findByRoleId(Long roleId);
}
