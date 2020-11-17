package com.itgacl.magic4j.modules.api.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.libcommon.util.GUIDUtil;
import com.itgacl.magic4j.modules.api.config.WxMaConfiguration;
import com.itgacl.magic4j.modules.api.service.WxMiniAppService;
import com.itgacl.magic4j.modules.demo.vo.AppLoginUserVo;
import com.itgacl.magic4j.modules.demo.vo.WxLoginTokenVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class WxMiniAppServiceImpl implements WxMiniAppService {

    @Override
    public WxLoginTokenVo login(String appid, String code) {
        final WxMaService wxService = WxMaConfiguration.getMaService(appid);
        try {
            WxMaJscode2SessionResult session = wxService.getUserService().getSessionInfo(code);
            String sessionKey = session.getSessionKey();
            String openId = session.getOpenid();
            //生成一个登录token
            String token = GUIDUtil.genRandomGUID();
            WxLoginTokenVo loginTokenVo = new WxLoginTokenVo();
            loginTokenVo.setOpenId(openId);
            loginTokenVo.setSessionKey(sessionKey);
            loginTokenVo.setToken(token);
            //todo 保存登录用户Token到缓存
            return loginTokenVo;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new Magic4jException("用户登录出错，请检查登录凭证是否正确");
        }
    }

    @Override
    public AppLoginUserVo saveUserInfo(WxMaUserInfo userInfo) {
        return null;
    }

    @Override
    public void saveUserPhone(String openId, WxMaPhoneNumberInfo phoneNoInfo) {

    }

    @Override
    public void logout(String token) {

    }
}
