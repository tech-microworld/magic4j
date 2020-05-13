package com.itgacl.magic4j.common.config;

import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.core.parser.ISqlParserFilter;
import com.baomidou.mybatisplus.extension.parsers.BlockAttackSqlParser;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.pagination.optimize.JsqlParserCountOptimize;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import com.itgacl.magic4j.common.tenant.Magic4jTenantHandler;
import com.itgacl.magic4j.common.tenant.Magic4jTenantSqlParser;
import com.itgacl.magic4j.common.tenant.TenantConfig;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.statement.delete.Delete;
import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ReflectionUtils;

import java.util.ArrayList;
import java.util.List;

@Slf4j
//扫描dao层的mapper类
@MapperScan("com.itgacl.magic4j.modules.*.mapper")
@Configuration
public class MybatisPlusConfig {

    @Autowired
    private Magic4jTenantHandler tenantHandler; //多租户处理器

    @Autowired
    private TenantConfig tenantConfig;

    /**
     *
     * 允许删除全部数据的表集合
     */
    @Value("#{'${magic4j.allowDeleteAllTables}'.split(',')}")
    private List<String> allowDeleteAllTables;

    /**
     * 分页拦截器
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        // 设置请求的页面大于最大页后操作， true调回到首页，false 继续请求  默认false
        // paginationInterceptor.setOverflow(false);
        // 设置最大单页限制数量，默认 500 条，-1 不受限制
        // paginationInterceptor.setLimit(500);
        // 开启 count 的 join 优化,只针对部分 left join
        paginationInterceptor.setCountSqlParser(new JsqlParserCountOptimize(true));
        List<ISqlParser> sqlParserList = new ArrayList<>();
        // 攻击 SQL 阻断解析器、加入解析链，作用是阻止恶意的全表更新删除
        sqlParserList.add(new BlockAttackSqlParser(){
            /**
             * 启用了攻击 SQL 阻断解析器(BlockAttackSqlParser)后，mybatisPlus就不允许全部删除或者更新
             * 如果想自定义处理逻辑，可以重写父类processDelete、processUpdate方法
             * 重新processDelete方法，允许指定的表可以删除所有数据
             * @param delete
             */
            @Override
            public void processDelete(Delete delete) {
                if (doTableMatch(delete.getTable().getName())) {//匹配是否允许全表删除
                   return;
                }
                super.processDelete(delete);//阻断，不允许全部删除
            }
        });
        if(tenantConfig.isEnabled()){//启用多租户模式
            log.debug("启用多租户模式");
            //多租户SQL解析器
            TenantSqlParser tenantSqlParser = new Magic4jTenantSqlParser();
            tenantSqlParser.setTenantHandler(tenantHandler);
            sqlParserList.add(tenantSqlParser);
        }
        paginationInterceptor.setSqlParserList(sqlParserList);
        return paginationInterceptor;
    }


    private boolean doTableMatch(String tableName) {
        return allowDeleteAllTables.stream().anyMatch((e) -> e.equalsIgnoreCase(tableName));
    }
}
