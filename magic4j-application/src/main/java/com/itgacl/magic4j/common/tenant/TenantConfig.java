package com.itgacl.magic4j.common.tenant;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname TenantConfig
 * @Description 多租户配置
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 11:36
 * @Version 1.0
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "magic4j.tenant")
public class TenantConfig {

    /**
     * 租户id列名
     */
    private String tenantIdColumn;

    /**
     * 多租户的忽略数据表集合
     */
    private List<String> ignoreTenantTables = new ArrayList<>();

    /**
     * 是否启用多租户模式
     */
    private boolean enabled;
}
