package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysAuthResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysAuthResource;

import java.util.List;

/**
 * @Classname SysAuthResourceService
 * @Description 系统API资源(API接口)详细信息表 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-10
 * @Version 1.0
 */
public interface SysAuthResourceService extends IService<SysAuthResource> {

    void create(SysAuthResourceDTO sysAuthResourceDTO);

    void update(SysAuthResourceDTO sysAuthResourceDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysAuthResourceDTO getSysAuthResourceById(Long id);

    void deleteAll();

    List<SysAuthResourceDTO> getList(QueryWrapper queryWrapper);
}
