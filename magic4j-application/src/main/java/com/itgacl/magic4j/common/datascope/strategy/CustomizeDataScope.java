package com.itgacl.magic4j.common.datascope.strategy;

import cn.hutool.core.util.ArrayUtil;
import com.itgacl.magic4j.common.datascope.DataScopeTypeEnum;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * @Classname CustomizeDataScope
 * @Description 自定义部门数据权限
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 16:34
 * @Version 1.0
 */
@Component("4")
public class CustomizeDataScope implements DataScopeHandler {

    @Override
    public List<Long> getDeptIds(SysRoleDTO roleDto, DataScopeTypeEnum dataScopeTypeEnum) {
        List<Long> ids = new ArrayList<>();
        if(ArrayUtil.isNotEmpty(roleDto.getDeptIds())){
            List<Long> roleDeptIds = Arrays.asList(roleDto.getDeptIds());
            Set<Long> set = new HashSet<>(roleDeptIds);
            ids.addAll(set);
        }
        return ids;
    }
}
