package com.itgacl.magic4j.libcommon.component.storage.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LocalStorageConfig implements WebMvcConfigurer {

    private final static Logger LOG = LoggerFactory.getLogger(LocalStorageConfig.class);

    @Value("${magic4j.storage.local.fileSavePath}")
    private String fileSavePath; //上传到本地服务器的文件的物理保存地址

    @Value("${magic4j.storage.local.fileUrlPathPattern}")
    private String fileUrlPathPattern; //上传到本地服务器的文件的访问映射地址

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /**
         * 配置静态资源目录
         */
        registry.addResourceHandler(fileUrlPathPattern).addResourceLocations("file:" + fileSavePath+"/");
        WebMvcConfigurer.super.addResourceHandlers(registry);
        LOG.info("FileConfig配置静态资源目录，fileSavePath：{}，fileUrlPathPattern：{}",fileSavePath,fileUrlPathPattern);
    }

}
