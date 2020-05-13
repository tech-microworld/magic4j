package com.itgacl.magic4j.common.datascope.strategy;


import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;

import java.util.List;

/**
 * @Classname AbstractDataScopeHandler
 * @Description 创建抽象策略角色 主要作用 数据权限范围使用
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:26
 * @Version 1.0
 */

public interface DataScopeHandler {

    /**
     * @param roleDto
     * @param dataScopeTypeEnum
     * @return
     */
    List<Long> getDeptIds(SysRoleDTO roleDto, DataScopeTypeEnum dataScopeTypeEnum);
}
