package com.itgacl.magic4j.modules.sys.mapper;

import com.itgacl.magic4j.modules.sys.entity.SysResource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统资源 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysResourceMapper extends BaseMapper<SysResource> {

    /**
     * 根据用户查询系统菜单列表
     *
     * @return 资源列表
     */
    List<SysResource> selectMenuResList(@Param("userId") Long userId, @Param("name") String name);
}
