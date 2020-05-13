package com.itgacl.magic4j.modules.sys.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.itgacl.magic4j.datascope.DataScope;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itgacl.magic4j.modules.sys.entity.ext.SysDeptExt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
public interface SysDeptMapper extends BaseMapper<SysDept> {

    @DataScope(tableFieldName = "id") //数据权限控制
    @Override
    List<SysDept> selectList(@Param("ew") Wrapper<SysDept> queryWrapper);

    @DataScope(tableFieldName = "id") //数据权限控制
    List<SysDeptExt> queryList();
}
