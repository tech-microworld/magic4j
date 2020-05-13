package com.itgacl.magic4j.common.datascope;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @Classname TenantConfig
 * @Description 数据权限开关配置
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 11:36
 * @Version 1.0
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "magic4j.data-scope")
public class DataScopeConfig {

    /**
     * 是否启用数据权限过滤
     */
    private boolean enabled;
}
