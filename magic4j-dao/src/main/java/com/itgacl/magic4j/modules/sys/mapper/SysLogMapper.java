package com.itgacl.magic4j.modules.sys.mapper;

import com.baomidou.mybatisplus.annotation.SqlParser;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 系统日志 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysLogMapper extends BaseMapper<SysLog> {

    /**
     * 查找模块名
     * @return List<String>
     */
   List<String> getModuleNameList();

    /**
     * 删除全部
     */
   void deleteAll();

    @SqlParser(filter = true)//不走租户的配置方式
    @Override
    int insert(SysLog entity);
}
