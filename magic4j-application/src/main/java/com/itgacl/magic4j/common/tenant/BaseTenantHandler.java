package com.itgacl.magic4j.common.tenant;

import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.itgacl.magic4j.common.bean.LoginUser;

public interface BaseTenantHandler extends TenantHandler {

    boolean doFilter();
}
