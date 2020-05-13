package com.itgacl.magic4j.libcommon.component.cache.redis;

import com.itgacl.magic4j.libcommon.component.cache.caffeine.CaffeineCacheConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisClientConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

import java.time.Duration;

/**
 * Redis单机配置
 */
@Configuration
@ConditionalOnMissingBean(CaffeineCacheConfig.class)
@ConditionalOnProperty(prefix = "redis.connection", value = "type", havingValue = "standalone")
public class RedisStandaloneConfig extends RedisCacheConfig {


    @Value("${redis.standalone.host}")
    private String host;

    @Value("${redis.standalone.port}")
    private Integer port;

    @Value("${redis.standalone.clientName}")
    private String clientName;

    @Value("${redis.standalone.connectTimeout}")
    private Long connectTimeout;

    @Value("${redis.standalone.readTimeout}")
    private Long readTimeout;

    @Value("${redis.standalone.useDefaultClientConfig}")
    private boolean useDefaultClientConfig;

    @Value("${redis.standalone.usePoolConfig}")
    private boolean usePoolConfig;

    @Value("${redis.db}")
    private Integer db;

    @Value("${redis.password}")
    private String password;

    public JedisConnectionFactory loadFactory() {
        RedisStandaloneConfiguration standaloneConfiguration = new RedisStandaloneConfiguration();
        standaloneConfiguration.setHostName(host);
        standaloneConfiguration.setPort(port);
        standaloneConfiguration.setDatabase(db);
        standaloneConfiguration.setPassword(password);
        if (useDefaultClientConfig) {
            return new JedisConnectionFactory(standaloneConfiguration);
        } else {
            return new JedisConnectionFactory(standaloneConfiguration, buildClientConfig());
        }
    }

    private JedisClientConfiguration buildClientConfig() {
        if (usePoolConfig) {
            return JedisClientConfiguration.builder()
                    .clientName(clientName)
                    .connectTimeout(Duration.ofMillis(connectTimeout))
                    .readTimeout(Duration.ofMillis(readTimeout))
                    .usePooling().poolConfig(buildPoolConfig())
                    .build();
        } else {
            return JedisClientConfiguration.builder()
                    .clientName(clientName)
                    .connectTimeout(Duration.ofMillis(connectTimeout))
                    .readTimeout(Duration.ofMillis(readTimeout)).build();
        }
    }
}