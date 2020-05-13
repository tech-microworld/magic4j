package com.itgacl.magic4j.common.datascope.strategy;

import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.itgacl.magic4j.modules.sys.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Classname AllDataScope
 * @Description 所有部门权限
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:26
 * @Version 1.0
 */
@Component("1")
public class AllDataScope implements DataScopeHandler {

    @Autowired
    private SysDeptService deptService;

    @Override
    public List<Long> getDeptIds(SysRoleDTO roleDto, DataScopeTypeEnum dataScopeTypeEnum) {
        List<SysDept> sysDepts = deptService.list();
        return sysDepts.stream().map(SysDept::getId).collect(Collectors.toList());
    }
}
