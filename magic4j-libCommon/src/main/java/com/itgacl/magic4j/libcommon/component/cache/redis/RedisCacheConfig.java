package com.itgacl.magic4j.libcommon.component.cache.redis;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.format.support.DefaultFormattingConversionService;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Redis缓存配置
 */
@Configuration
@ConditionalOnProperty(prefix = "magic4j.cache", value = "type", havingValue = "redis", matchIfMissing = false)
@EnableCaching
@Data
public abstract class RedisCacheConfig {

    @Value("${redis.pool_config.maxTotal}")
    private int maxTotal;

    @Value("${redis.pool_config.maxIdle}")
    private int maxIdle;

    @Value("${redis.pool_config.minIdle}")
    private int minIdle;

    @Value("${redis.pool_config.testOnBorrow}")
    private boolean testOnBorrow;

    @Value("${redis.pool_config.testOnReturn}")
    private boolean testOnReturn;

    @Value("${redis.pool_config.testWhileIdle}")
    private boolean testWhileIdle;

    @Value("${redis.pool_config.minEvictableMs}")
    private long minEvictableMs;

    @Value("${redis.pool_config.evictionRunsMs}")
    private long evictionRunsMs;

    @Value("${redis.pool_config.maxWaitMills}")
    private long maxWaitMills;

    @Value("${redis.pool_config.numberTestsPerEvictionRun}")
    private int numberTestsPerEvictionRun;

    @Value("${redis.pool_config.blockWhenExhausted}")
    private boolean blockWhenExhausted;

    @Bean
    public RedisConnectionFactory redisConnectionFactory() {
        return loadFactory();
    }

    protected abstract JedisConnectionFactory loadFactory();

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory cf) {
        DefaultFormattingConversionService redisConversionService = new DefaultFormattingConversionService();
        RedisCacheConfiguration.registerDefaultConverters(redisConversionService);
        RedisCacheConfiguration configuration = RedisCacheConfiguration.defaultCacheConfig().withConversionService(redisConversionService);
        return RedisCacheManager.builder(cf).cacheDefaults(configuration).build();
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory());
        return template;
    }


    JedisPoolConfig buildPoolConfig() {
        final JedisPoolConfig poolConfig = new JedisPoolConfig();
        poolConfig.setMaxTotal(maxTotal);
        poolConfig.setMaxIdle(maxIdle);
        poolConfig.setMinIdle(minIdle);
        poolConfig.setTestOnBorrow(testOnBorrow);
        poolConfig.setTestOnReturn(testOnReturn);
        poolConfig.setTestWhileIdle(testWhileIdle);
        poolConfig.setMinEvictableIdleTimeMillis(minEvictableMs);
        poolConfig.setTimeBetweenEvictionRunsMillis(evictionRunsMs);
        poolConfig.setMaxWaitMillis(maxWaitMills);
        poolConfig.setNumTestsPerEvictionRun(numberTestsPerEvictionRun);
        poolConfig.setBlockWhenExhausted(blockWhenExhausted);
        return poolConfig;
    }
}
