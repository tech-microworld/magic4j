package com.itgacl.magic4j.common.tenant;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.select.SelectBody;
import net.sf.jsqlparser.statement.update.Update;

import java.util.List;

public class Magic4jTenantSqlParser extends TenantSqlParser {

    private Magic4jTenantHandler tenantHandler;

    /**
     * select 语句处理
     */
    @Override
    public void processSelectBody(SelectBody selectBody) {
        if (tenantHandler.doFilter()){
            super.processSelectBody(selectBody);
        }
    }

    /**
     * update 语句处理
     */
    @Override
    public void processUpdate(Update update) {
        if (tenantHandler.doFilter()) {
            List<Table> tableList = update.getTables();
            Assert.isTrue(null != tableList && tableList.size() < 2,
                    "Failed to process multiple-table update, please exclude the statementId");
            Table table = tableList.get(0);
            if (!this.tenantHandler.doTableFilter(table.getName())) {
                update.setWhere(this.andExpression(table, update.getWhere()));
            }
        }
    }

    /**
     * delete 语句处理
     */
    @Override
    public void processDelete(Delete delete) {
        if (tenantHandler.doFilter()) {
            if (!this.tenantHandler.doTableFilter(delete.getTable().getName())) {
                delete.setWhere(this.andExpression(delete.getTable(), delete.getWhere()));
            }
        }
    }

    @Override
    public TenantSqlParser setTenantHandler(TenantHandler tenantHandler) {
        this.tenantHandler = (Magic4jTenantHandler) tenantHandler;
        return super.setTenantHandler(this.tenantHandler);
    }
}
