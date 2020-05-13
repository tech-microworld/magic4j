package com.itgacl.magic4j.common.datascope.strategy;


import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Classname DataScopeContext
 * @Description 创建环境角色Context:
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:45
 * @Version 1.0
 */
@Service
public class DataScopeContext {

    @Autowired
    private final Map<String, DataScopeHandler> strategyMap = new ConcurrentHashMap<>();

    /**
     * Component里边的1是指定其名字，这个会作为key放到strategyMap里
     * @param strategyMap
     */
    public DataScopeContext(Map<String, DataScopeHandler> strategyMap) {
        strategyMap.forEach(this.strategyMap::put);
    }

    public List<Long> getDeptIdsForDataScope(SysRoleDTO roleDto, Integer type) {
        return strategyMap.get(String.valueOf(type)).getDeptIds(roleDto, DataScopeTypeEnum.valueOf(type));
    }
}
