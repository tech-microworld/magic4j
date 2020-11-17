package com.itgacl.fastdfs;

import com.itgacl.fastdfs.annotation.EnableFastDFS;
import com.itgacl.fastdfs.client.FastDFSConfig;
import com.itgacl.fastdfs.client.FastDFSClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@ConditionalOnBean(annotation = EnableFastDFS.class)
@EnableConfigurationProperties(FastDFSConfig.class)
public class FastdfsAutoConfiguration {

    @Autowired
    private FastDFSConfig fastDFSConfig;

    @Bean
    public FastdfsService fastdfsService(){
        log.debug("FastdfsAutoConfiguration init FastdfsService");
        FastdfsService fastdfsService = new FastdfsService();
        FastDFSClient fastDFSClient = new FastDFSClient(fastDFSConfig);
        fastdfsService.setFastDFSClient(fastDFSClient);
        return fastdfsService;
    }
}
