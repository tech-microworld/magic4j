package com.itgacl.magic4j.common.tenant;

import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 多租户处理器
 */
@Slf4j
@Component
public class Magic4jTenantHandler implements BaseTenantHandler {

    @Autowired
    private TenantConfig tenantConfig;

    /**
     * 返回true进行租户过滤，返回false不进行过滤
     * @return
     */
    @Override
    public boolean doFilter() {
        LoginUser loginUser = LoginUserContext.get();
        //未登录不进行过滤
        return loginUser != null;
    }

    @Override
    public Expression getTenantId(boolean where) {
        LoginUser loginUser = LoginUserContext.get();
        if(loginUser == null){
            return new LongValue(Constants.SUPER_TENANT_ID);//默认使用超级租户ID进行过滤
        }else {
            return new LongValue(loginUser.getTenantId());//使用登录用户的租户ID进行过滤
        }
    }

    /**
     * 租户字段名
     * @return
     */
    @Override
    public String getTenantIdColumn() {
        return tenantConfig.getTenantIdColumn();
    }

    /**
     * 根据表名判断是否进行过滤
     * 忽略掉一些表：如租户表（sys_tenant）本身不需要执行这样的处理
     *
     * @param tableName
     * @return
     */
    @Override
    public boolean doTableFilter(String tableName) {
        return tenantConfig.getIgnoreTenantTables().stream().anyMatch((e) -> e.equalsIgnoreCase(tableName));
    }
}
