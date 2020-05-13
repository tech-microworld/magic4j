package com.itgacl.cloud.storage;

import com.itgacl.cloud.storage.config.QiniuKodoConfig;
import com.itgacl.cloud.storage.service.QiniuKodoStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
//@ConditionalOnWebApplication //web应用才生效
@ConditionalOnProperty(prefix = "qiniu.kodo", value = "enabled", havingValue = "true")
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
