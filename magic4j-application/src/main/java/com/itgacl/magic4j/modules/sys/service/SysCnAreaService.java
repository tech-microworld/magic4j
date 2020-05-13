package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.modules.sys.vo.AreaVo;

import java.util.List;

/**
 * SysCnAreaService
 * @author 孤傲苍狼
 */
public interface SysCnAreaService extends IService<SysCnArea> {

    void create(SysCnAreaDTO sysCnAreaDTO);

    void update(SysCnAreaDTO sysCnAreaDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysCnAreaDTO getSysCnAreaById(Long id);

    void deleteAll();

    List<SysCnAreaDTO> getList(QueryWrapper queryWrapper);

    List<AreaVo> geAreaTreeList();

    List<AreaVo> geAreaTreeListById(Long id);

    AreaVo getAreaTreeById(Long id);
}
