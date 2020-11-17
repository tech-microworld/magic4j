package com.itgacl.ssh2.jsch;

import com.itgacl.ssh2.jsch.annotation.EnableSFTP;
import com.itgacl.ssh2.jsch.client.SSH2Client;
import com.itgacl.ssh2.jsch.client.SSH2Config;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@ConditionalOnBean(annotation = EnableSFTP.class)
@EnableConfigurationProperties(SSH2Config.class)
public class JschAutoConfiguration {

    @Autowired
    private SSH2Config ssh2Config;

    @Bean
    public JschService jschService(){
        log.debug("JschAutoConfiguration init JschService");
        SSH2Client ssh2Client = new SSH2Client(ssh2Config);
        return new JschService(ssh2Client);
    }
}
