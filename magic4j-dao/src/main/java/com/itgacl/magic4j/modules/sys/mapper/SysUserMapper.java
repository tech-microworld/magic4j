package com.itgacl.magic4j.modules.sys.mapper;

import com.baomidou.mybatisplus.annotation.SqlParser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.itgacl.magic4j.datascope.DataScope;
import com.itgacl.magic4j.modules.sys.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 系统用户 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    @DataScope //数据权限过滤
    @Override
    List<SysUser> selectList(@Param(Constants.WRAPPER)Wrapper<SysUser> queryWrapper);

    @DataScope //数据权限过滤
    @Override
    <E extends IPage<SysUser>> E selectPage(E page, @Param(Constants.WRAPPER)Wrapper<SysUser> queryWrapper);

    @SqlParser(filter = true)//不走租户的配置方式
    @Override
    int insert(SysUser entity);

    @SqlParser(filter = true)//不走租户的配置方式
    @Override
    int deleteById(Serializable id);

    @SqlParser(filter = true)//不走租户的配置方式
    @Override
    int deleteBatchIds(@Param(Constants.COLLECTION)Collection<? extends Serializable> idList);

    @SqlParser(filter = true)//不走租户的配置方式
    @Override
    SysUser selectOne(@Param(Constants.WRAPPER)Wrapper<SysUser> queryWrapper);

    @SqlParser(filter = true)//不走租户的配置方式
    List<SysUser> getTenantUserList(@Param(Constants.WRAPPER)QueryWrapper<SysUser> queryWrapper);

    @SqlParser(filter = true)//不走租户的配置方式
    List<SysUser> page(@Param("page") IPage<SysUser> page,@Param(Constants.WRAPPER)QueryWrapper<SysUser> queryWrapper);
}
