package com.itgacl.cloud.storage;

import com.itgacl.cloud.storage.annotation.EnableCos;
import com.itgacl.cloud.storage.config.TencentCosConfig;
import com.itgacl.cloud.storage.service.TencentCosStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@ConditionalOnBean(annotation = EnableCos.class)
@EnableConfigurationProperties(TencentCosConfig.class)
public class TencentCosAutoConfiguration {

    @Autowired
    private TencentCosConfig config;

    @Bean
    public TencentCosStorageService tencentCosService(){
        log.debug("TencentCosAutoConfiguration init TencentCosStorageService");
        TencentCosStorageService tencentCosService = new TencentCosStorageService(config);
        return tencentCosService;
    }
}
