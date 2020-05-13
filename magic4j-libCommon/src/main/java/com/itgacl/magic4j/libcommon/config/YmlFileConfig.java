package com.itgacl.magic4j.libcommon.config;

import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

/**
 * 加载自定义yml配置文件
 */
@Configuration
public class YmlFileConfig {

    /**
     * 通过PropertySourcePlaceholderConfigurer来加载自定义的yml文件，暴露yml文件到spring environment
     * @return
     */
    @Bean
    public static PropertySourcesPlaceholderConfigurer properties() {
        PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
        YamlPropertiesFactoryBean yaml = new YamlPropertiesFactoryBean();
        //ClassPathResource commonYml = new ClassPathResource("config/common.yml");
        //ClassPathResource fileManagerConfigYml = new ClassPathResource("config/fileManager/config.yml");
        //yaml.setResources(commonYml);
        //configurer.setProperties(yaml.getObject());
        return configurer;
    }
}
