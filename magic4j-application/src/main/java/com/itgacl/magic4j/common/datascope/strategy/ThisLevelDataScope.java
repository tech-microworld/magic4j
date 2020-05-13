package com.itgacl.magic4j.common.datascope.strategy;

import cn.hutool.core.util.ObjectUtil;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname ThisLevelHandler
 * @Description 本级
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:38
 * @Version 1.0
 */
@Component("2")
public class ThisLevelDataScope implements DataScopeHandler {

    @Override
    public List<Long> getDeptIds(SysRoleDTO roleDto, DataScopeTypeEnum dataScopeTypeEnum) {
        // 用于存储部门id
        List<Long> deptIds = new ArrayList<>();
        Long deptId = LoginUserContext.get().getDeptId();
        if(ObjectUtil.isNotEmpty(deptId)){
            deptIds.add(deptId);
        }
        return deptIds;
    }
}
