package com.itgacl.cloud.storage;

import com.itgacl.cloud.storage.annotation.EnableKodo;
import com.itgacl.cloud.storage.config.QiniuKodoConfig;
import com.itgacl.cloud.storage.service.QiniuKodoStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@ConditionalOnBean(annotation = EnableKodo.class)
@EnableConfigurationProperties(QiniuKodoConfig.class)
public class QiniuKodoAutoConfiguration {

    @Autowired
    private QiniuKodoConfig config;

    @Bean
    public QiniuKodoStorageService qiniuKodoService(){
        log.debug("QiniuKodoAutoConfiguration init QiniuKodoStorageService");
        QiniuKodoStorageService qiniuKodoService = new QiniuKodoStorageService(config);
        return qiniuKodoService;
    }
}
