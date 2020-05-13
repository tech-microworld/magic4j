package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysTenantDTO;
import com.itgacl.magic4j.modules.sys.entity.SysTenant;

import java.util.List;

/**
 * SysTenantService
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
public interface SysTenantService extends IService<SysTenant> {

    void create(SysTenantDTO sysTenantDTO);

    void update(SysTenantDTO sysTenantDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysTenantDTO getSysTenantById(Long id);

    void deleteAll();

    List<SysTenantDTO> getList(QueryWrapper queryWrapper);
}
