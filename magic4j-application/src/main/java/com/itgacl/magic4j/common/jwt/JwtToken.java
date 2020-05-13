package com.itgacl.magic4j.common.jwt;

import io.jsonwebtoken.Claims;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@AllArgsConstructor
@Data
public final class JwtToken implements Serializable{

    private final String token;

    private Claims claims;
}
