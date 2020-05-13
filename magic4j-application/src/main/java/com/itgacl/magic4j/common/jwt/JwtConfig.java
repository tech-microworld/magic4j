package com.itgacl.magic4j.common.jwt;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "magic4j.jwt")
public class JwtConfig {

    private String authorization;

    /**
     * 过期时间
     */
    private Integer tokenExpirationTime;

    /**
     * Token issuer.
     */
    private String tokenIssuer;

    /**
     * Key is used to sign
     */
    private String tokenSigningKey;

    /**
     * can be refreshed during this timeframe.
     */
    private Integer refreshTokenExpTime;

    /**
     * 是否启用
     */
    private boolean enabled;

}