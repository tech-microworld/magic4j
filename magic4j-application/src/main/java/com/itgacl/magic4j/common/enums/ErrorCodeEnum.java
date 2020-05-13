/*
 * Copyright (c) 2018-2022 Caratacus, (caratacus@qq.com).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package com.itgacl.magic4j.common.enums;

import javax.servlet.http.HttpServletResponse;

/**
 * 业务异常枚举
 *
 * @author Caratacus
 */
public enum ErrorCodeEnum {

    /**
     * 400
     */
    BAD_REQUEST(HttpServletResponse.SC_BAD_REQUEST, "请求参数错误或不完整"),
    /**
     * JSON格式错误
     */
    JSON_FORMAT_ERROR(HttpServletResponse.SC_BAD_REQUEST, "JSON格式错误"),
    /**
     * 401
     */
    UNAUTHORIZED(HttpServletResponse.SC_UNAUTHORIZED, "请先进行认证"),
    /**
     * 403
     */
    FORBIDDEN(HttpServletResponse.SC_FORBIDDEN, "无权查看"),
    /**
     * 404
     */
    NOT_FOUND(HttpServletResponse.SC_NOT_FOUND, "未找到该路径"),
    /**
     * 405
     */
    METHOD_NOT_ALLOWED(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "请求方式不支持"),
    /**
     * 406
     */
    NOT_ACCEPTABLE(HttpServletResponse.SC_NOT_ACCEPTABLE, "不可接受该请求"),
    /**
     * 411
     */
    LENGTH_REQUIRED(HttpServletResponse.SC_LENGTH_REQUIRED, "长度受限制"),
    /**
     * 415
     */
    UNSUPPORTED_MEDIA_TYPE(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "不支持的媒体类型"),
    /**
     * 416
     */
    REQUESTED_RANGE_NOT_SATISFIABLE(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE, "不能满足请求的范围"),
    /**
     * 500
     */
    INTERNAL_SERVER_ERROR(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "服务器正在升级，请耐心等待"),
    /**
     * 503
     */
    SERVICE_UNAVAILABLE(HttpServletResponse.SC_SERVICE_UNAVAILABLE, "请求超时"),
    /**
     * 演示系统，无法该操作
     */
    DEMO_SYSTEM_CANNOT_DO(HttpServletResponse.SC_SERVICE_UNAVAILABLE, "演示系统，无法该操作"),

    //----------------------------------------------------业务异常----------------------------------------------------
    /**
     * 用户名密码错误
     */
    USERNAME_OR_PASSWORD_IS_WRONG(HttpServletResponse.SC_BAD_REQUEST, "用户名或密码错误"),
    /**
     * 用户被冻结
     */
    USER_IS_DISABLED(HttpServletResponse.SC_NOT_ACCEPTABLE, "用户已经被冻结"),
    /**
     * 未找到该用户
     */
    USER_NOT_FOUND(HttpServletResponse.SC_NOT_FOUND, "未找到该用户"),
    /**
     * 原密码不正确
     */
    ORIGINAL_PASSWORD_IS_INCORRECT(HttpServletResponse.SC_BAD_REQUEST, "原密码不正确"),
    /**
     * 用户名已存在
     */
    USERNAME_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "用户名已存在"),

    /**
     * 邮箱已存在
     */
    EMAIL_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "邮箱已存在"),
    /**
     * 手机号已存在
     */
    CELLPHONE_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "手机号已存在"),
    /**
     * 未找到该菜单
     */
    MENU_NOT_FOUND(HttpServletResponse.SC_NOT_FOUND, "未找到该菜单"),

    /**
     * 角色已存在
     */
    ROLE_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "角色已存在"),

    /**
     * 资源已存在
     */
    RESOURCE_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "资源已存在"),

    NAME_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "该名称已经存在"),
    TYPE_ALREADY_EXISTS(HttpServletResponse.SC_BAD_REQUEST, "该类型已经存在"),

    /**
     * 数据不存在
     */
    DATA_NOT_EXIST(HttpServletResponse.SC_NOT_FOUND, "数据不存在"),
    DATA_EXIST(HttpServletResponse.SC_BAD_REQUEST, "数据已经存在"),

    DATA_FORBIDDEN_UPDATE(HttpServletResponse.SC_FORBIDDEN, "禁止修改静态数据");

    private final int httpCode;
    private final String msg;

    ErrorCodeEnum(int httpCode,String msg) {
        this.httpCode = httpCode;
        this.msg = msg;
    }

    public int httpCode() {
        return this.httpCode;
    }

    public String msg() {
        return this.msg;
    }
}
