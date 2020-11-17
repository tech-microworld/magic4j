package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysDictDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDict;
import com.itgacl.magic4j.modules.sys.excel.DictExcel;
import com.itgacl.magic4j.modules.sys.excel.UserExcel;

import java.util.List;

/**
 * SysDictService
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysDictService extends IService<SysDict> {

    void create(SysDictDTO sysDictDTO);

    void update(SysDictDTO sysDictDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysDictDTO getSysDictById(Long id);

    void deleteAll();

    List<SysDictDTO> getList(QueryWrapper<SysDict> queryWrapper);

    void importDict(List<DictExcel> data, Boolean isCovered);
}
