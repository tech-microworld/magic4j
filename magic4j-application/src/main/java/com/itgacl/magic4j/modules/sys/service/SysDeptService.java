package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysDeptDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.itgacl.magic4j.modules.sys.entity.ext.SysDeptExt;
import com.itgacl.magic4j.modules.sys.vo.AreaVo;
import com.itgacl.magic4j.modules.sys.vo.DeptTreeVo;

import java.util.List;

/**
 * SysDeptService
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
public interface SysDeptService extends IService<SysDept> {

    void create(SysDeptDTO sysDeptDTO);

    void update(SysDeptDTO sysDeptDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysDeptDTO getSysDeptById(Long id);

    void deleteAll();

    List<SysDeptDTO> getList(QueryWrapper<SysDept> queryWrapper);


    DeptTreeVo getDeptTreeById(Long id);

    /**
     * 获取部门树
     * @return
     */
    List<DeptTreeVo> getDeptTree(SysDeptDTO dept);

    /**
     * 通过部门id查询于此相关的部门ids(包括自身和子部门的ID)
     * @param deptId
     * @return
     */
    List<Long> selectDeptIds(Long deptId);

    List<SysDeptExt> queryList();
}
