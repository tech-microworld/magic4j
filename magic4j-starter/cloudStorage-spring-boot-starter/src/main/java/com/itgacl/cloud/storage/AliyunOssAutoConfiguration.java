package com.itgacl.cloud.storage;

import com.itgacl.cloud.storage.annotation.EnableOss;
import com.itgacl.cloud.storage.config.AliyunOssConfig;
import com.itgacl.cloud.storage.service.AliyunOssStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@ConditionalOnBean(annotation = EnableOss.class)
@EnableConfigurationProperties(AliyunOssConfig.class)
public class AliyunOssAutoConfiguration {

    @Autowired
    private AliyunOssConfig config;

    @Bean
    public AliyunOssStorageService aliyunOssService(){
        log.debug("---AliyunOssAutoConfiguration init AliyunOssStorageService---");
        AliyunOssStorageService ossStorageService = new AliyunOssStorageService(config);
        return ossStorageService;
    }
}
