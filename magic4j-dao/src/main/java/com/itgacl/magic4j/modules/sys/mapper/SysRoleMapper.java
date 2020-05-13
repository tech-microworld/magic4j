package com.itgacl.magic4j.modules.sys.mapper;

import com.baomidou.mybatisplus.annotation.SqlParser;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 系统角色 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    @SqlParser(filter = true)//不走租户的配置方式
    List<SysRole> getUserRoleList(Long userId);
}
