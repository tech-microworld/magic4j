package com.itgacl.magic4j.modules.api.controller;

import com.itgacl.magic4j.common.base.AppBaseController;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.itgacl.magic4j.common.base.AppBaseController;

import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.modules.api.config.WxMaConfiguration;
import com.itgacl.magic4j.modules.api.service.WxMiniAppService;
import com.itgacl.magic4j.modules.demo.dto.MiniAppUserInfo;
import com.itgacl.magic4j.modules.demo.service.MiniappUserService;

import com.itgacl.magic4j.modules.demo.vo.WxLoginTokenVo;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * @Classname MiniappUserController
 * @Description 微信小程序用户信息表 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-04
 * @Version 1.0
 */
@Api(tags = "小程序用户管理")
@RestController
@RequestMapping("/app/api/demo/miniappUser")
public class MiniappUserApiController extends AppBaseController{

    @Autowired
    private MiniappUserService miniappUserService;


    @Autowired
    private WxMiniAppService wxMiniAppService;

    @ApiOperation(value = "用户登录",notes = "登录成功后返回的data的值就是登录token")
    @ApiImplicitParam(name = "code",value = "用户登录凭证（有效期五分钟）",required = true)
    @Validator(value = "code",message = "参数校验错误，用户登录凭证不能为空")
    @PostMapping("/{appId}/login")
    public R<WxLoginTokenVo> login(@PathVariable("appId") String appId, String code) {
        WxLoginTokenVo loginTokenVo = wxMiniAppService.login(appId, code);
        return R.ok(loginTokenVo);
    }

    @ApiOperation("解密微信用户信息")
    @PostMapping("/{appId}/user/info")
    public R<WxMaUserInfo> getUserInfo(@PathVariable("appId") String appId , @RequestBody @Validated MiniAppUserInfo miniAppUserInfo) {
        final WxMaService wxService = WxMaConfiguration.getMaService(appId);
        String sessionKey = miniAppUserInfo.getSessionKey();
        // 用户信息校验
        if (!wxService.getUserService().checkUserInfo(sessionKey, miniAppUserInfo.getRawData(), miniAppUserInfo.getSignature())) {
            return R.fail("用户信息校验失败");
        }
        // 解密用户信息
        WxMaUserInfo userInfo = wxService.getUserService().getUserInfo(sessionKey, miniAppUserInfo.getEncryptedData(), miniAppUserInfo.getIv());
        return R.ok(userInfo);
    }

    @ApiOperation("获取用户绑定手机号信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "encryptedData",value = "微信用户信息的加密数据",required = true),
            @ApiImplicitParam(name = "iv",value = "加密算法的初始向量",required = true),
            @ApiImplicitParam(name = "sessionKey",value = "用于解密用户信息的sessionKey",required = true)
    })
    @Validator(value = {"encryptedData","iv"},
            message = {"参数校验错误，缺少微信用户信息的加密数据","参数校验错误，缺少加密算法的初始向量"})//使用自定义注解进行非空校验
    @PostMapping("/{appId}/user/phone")
    public R<WxMaPhoneNumberInfo> getUserPhone(@PathVariable("appId") String appId , String encryptedData, String iv, String sessionKey) {
        final WxMaService wxService = WxMaConfiguration.getMaService(appId);
        // 解密手机号
        WxMaPhoneNumberInfo phoneNoInfo = wxService.getUserService().getPhoneNoInfo(sessionKey, encryptedData, iv);
        return R.ok(phoneNoInfo);
    }
}