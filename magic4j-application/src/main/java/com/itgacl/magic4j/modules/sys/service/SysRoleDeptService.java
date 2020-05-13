package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDeptDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRoleDept;

import java.util.List;

/**
 * SysRoleDeptService
 * @author 孤傲苍狼
 * @since 2020-04-03
 */
public interface SysRoleDeptService extends IService<SysRoleDept> {

    void create(SysRoleDeptDTO sysRoleDeptDTO);

    void update(SysRoleDeptDTO sysRoleDeptDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysRoleDeptDTO getSysRoleDeptById(Long id);

    void deleteAll();

    List<SysRoleDeptDTO> getList(QueryWrapper queryWrapper);
}
