package com.itgacl.magic4j.common.datascope.strategy;

import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Classname ThisLevelChildenDataScope
 * @Description 本级以及子级
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:38
 * @Version 1.0
 */
@Component("3")
public class ThisLevelChildenDataScope implements DataScopeHandler {

    @Autowired
    private SysDeptService deptService;

    @Override
    public List<Long> getDeptIds(SysRoleDTO roleDto, DataScopeTypeEnum dataScopeTypeEnum) {
        Long deptId = LoginUserContext.get().getDeptId();
        return deptService.selectDeptIds(deptId);
    }
}
