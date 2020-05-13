package com.itgacl.magic4j.modules.sys.mapper;

import com.baomidou.mybatisplus.annotation.SqlParser;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 系统配置 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysConfigMapper extends BaseMapper<SysConfig> {

    @SqlParser(filter = true)//不走租户的配置方式
    SysConfig getConfigByKey(String key);
}
