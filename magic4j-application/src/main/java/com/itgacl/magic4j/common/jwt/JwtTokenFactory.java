package com.itgacl.magic4j.common.jwt;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.libcommon.constant.HttpStatus;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Slf4j
@Component
public class JwtTokenFactory {

    private static final String USER_ID = "userId";

    private static final String TENANT_ID = "tenantId";//租户ID

    private static final String DEPT_ID = "deptId";//部门ID

    private static final String REAL_NAME = "realName";

    private static final String EMAIL = "email";

    private static final String CELL_PHONE = "cellphone";

    private static final String HEAD_IMG = "headImg";

    private static final String ROLE_LIST = "roleList";

    private final JwtConfig jwtConfig;

    @Autowired
    public JwtTokenFactory(JwtConfig jwtConfig) {
        this.jwtConfig = jwtConfig;
    }

    /**
     * 创建jwt token
     * 根据登录用户信息进行创建
     */
    public JwtToken createJwtToken(LoginUser loginUser) {
        if (StringUtils.isBlank(loginUser.getUsername()))
            throw new Magic4jException("Cannot create JWT Token without username");

        /*if (CollectionUtil.isEmpty(loginUser.getPermsList()))
            throw new Magic4jException("User doesn't have any privileges");*/

        Claims claims = Jwts.claims().setSubject(loginUser.getUsername());
        claims.put(USER_ID, loginUser.getId());
        claims.put(TENANT_ID, loginUser.getTenantId());
        claims.put(DEPT_ID, loginUser.getDeptId());
        claims.put(REAL_NAME, loginUser.getRealName());
        claims.put(CELL_PHONE, loginUser.getCellphone());
        claims.put(HEAD_IMG, loginUser.getHeadImg());
        claims.put(EMAIL, loginUser.getEmail());
        claims.put(ROLE_LIST, loginUser.getRoleList());

        ZonedDateTime currentTime = ZonedDateTime.now();

        String token = Jwts.builder()
                .setClaims(claims)
                .setIssuer(jwtConfig.getTokenIssuer())
                .setIssuedAt(Date.from(currentTime.toInstant()))
                .setExpiration(Date.from(currentTime.plusSeconds(jwtConfig.getTokenExpirationTime()).toInstant()))
                .signWith(SignatureAlgorithm.HS512, jwtConfig.getTokenSigningKey())
                .compact();

        return new JwtToken(token, claims);
    }

    /**
     * 解析jwt
     * 通过解析Jwt获取登录用户信息
     * @param jwtToken
     * @return
     */
    public LoginUser parseJwtToken(String jwtToken) {
        Jws<Claims> jwsClaims = parseClaims(jwtToken);
        Claims claims = jwsClaims.getBody();
        String subject = claims.getSubject();
        LoginUser loginUser = new LoginUser();
        loginUser.setUsername(subject);
        loginUser.setId(claims.get(USER_ID,Long.class));
        loginUser.setTenantId(claims.get(TENANT_ID,Long.class));
        loginUser.setDeptId(claims.get(DEPT_ID,Long.class));
        loginUser.setRealName(claims.get(REAL_NAME,String.class));
        loginUser.setEmail(claims.get(EMAIL,String.class));
        loginUser.setHeadImg(claims.get(HEAD_IMG,String.class));
        loginUser.setEmail(claims.get(EMAIL,String.class));
        /**
         * claims.get(ROLE_LIST, List.class)这里返回的List里面的对象类型是LinkedHashMap，不是LoginUser.Role类型
         * 所以借助FastJson继续将这个LinkedHashMap进行序列化成JSON字符串，然后再反序列化成List<LoginUser.Role>
         */
        List<LoginUser.Role> roleList = JSON.parseArray(JSON.toJSONString(claims.get(ROLE_LIST, List.class)),LoginUser.Role.class);
        loginUser.setRoleList(roleList);
        return loginUser;
    }

    /**
     * 创建刷新token(用最少的用户信息去创建，以免创建的token长度过长)
     * @param loginUser
     * @return
     */
    public JwtToken createRefreshToken(LoginUser loginUser) {
        if (StringUtils.isBlank(loginUser.getUsername())) {
            throw new Magic4jException("Cannot create JWT Token without username");
        }
        ZonedDateTime currentTime = ZonedDateTime.now();
        Claims claims = Jwts.claims().setSubject(loginUser.getUsername());
        claims.put(USER_ID, loginUser.getId());

        String token = Jwts.builder()
                .setClaims(claims)
                .setIssuer(jwtConfig.getTokenIssuer())
                .setId(UUID.randomUUID().toString())
                .setIssuedAt(Date.from(currentTime.toInstant()))
                .setExpiration(Date.from(currentTime.plusSeconds(jwtConfig.getRefreshTokenExpTime()).toInstant()))
                .signWith(SignatureAlgorithm.HS512, jwtConfig.getTokenSigningKey())
                .compact();

        return new JwtToken(token, claims);
    }

    public LoginUser parseRefreshToken(String refreshToken) {
        Jws<Claims> jwsClaims = parseClaims(refreshToken);
        Claims claims = jwsClaims.getBody();
        String subject = claims.getSubject();
        LoginUser loginUser = new LoginUser();
        loginUser.setUsername(subject);
        loginUser.setId(claims.get(USER_ID,Long.class));
        return loginUser;
    }

    /**
     * 解析token里面的Claims
     * @param token
     * @return
     */
    private Jws<Claims> parseClaims(String token) {
        try {
            return Jwts.parser().setSigningKey(jwtConfig.getTokenSigningKey()).parseClaimsJws(token);
        } catch (UnsupportedJwtException | MalformedJwtException | IllegalArgumentException | SignatureException ex) {
            log.error("Invalid JWT Token", ex);//Token无法解析返回401状态码给客户端，让客户端重新登录
            throw new Magic4jException("Invalid JWT token: ", HttpStatus.UNAUTHORIZED);
        } catch (ExpiredJwtException expiredEx) {
            log.info("JWT Token is expired", expiredEx);//Token过期返回401状态码给客户端，让客户端重新登录
            throw new Magic4jException("JWT Token expired", HttpStatus.UNAUTHORIZED);
        }
    }

    public JwtConfig getJwtConfig() {
        return jwtConfig;
    }
}
