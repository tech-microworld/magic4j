package com.itgacl.magic4j.modules.api.service;

import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.itgacl.magic4j.modules.demo.vo.AppLoginUserVo;
import com.itgacl.magic4j.modules.demo.vo.WxLoginTokenVo;

/**
 * 针对小程序使用的Service
 */
public interface WxMiniAppService {

    /**
     * 微信小程序用户登录
     * @param code 登录凭证code
     * @return 登录token
     */
    WxLoginTokenVo login(String appid, String code);

    /**
     * 保存微信小程序用户信息
     * @return Result
     */
    AppLoginUserVo saveUserInfo(WxMaUserInfo userInfo);

    /**
     * 保存用户手机号
     * @param phoneNoInfo
     */
    void saveUserPhone(String openId,WxMaPhoneNumberInfo phoneNoInfo);

    /**
     * 退出登录
     * @param token
     */
    void logout(String token);
}
