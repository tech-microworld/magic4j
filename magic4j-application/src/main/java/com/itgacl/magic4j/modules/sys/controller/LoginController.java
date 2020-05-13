package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.lang.UUID;
import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.annotation.NotEmpty;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.VerifyCodeUtils;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import com.itgacl.magic4j.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class LoginController extends SuperController {

    @Autowired
    private SysUserService sysUserService;

    /**
     * 生成图片验证码
     * @throws IOException
     */
    @GetMapping("/captchaImage")
    public R captcha() throws IOException {
        // 生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        String uuid = UUID.fastUUID().toString();//随机UUID
        //将验证码保存到缓存中
        cacheService.set(Constants.VERIFY_CODE + uuid, verifyCode);
        // 生成图片
        int w = 111, h = 36;
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        VerifyCodeUtils.outputImage(w, h, stream, verifyCode);
        try {
            //生成一次性密钥
            RSA rsa = new RSA();
            String privateKeyBase64 = rsa.getPrivateKeyBase64();
            String publicKeyBase64 = rsa.getPublicKeyBase64();
            //将私密钥存放到缓存中
            cacheService.set(Constants.SECURITY.RSA_PRIVATE_KEY + uuid,privateKeyBase64);
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("img", "data:image/gif;base64," + Base64.encode(stream.toByteArray()));
            dataMap.put("uuid", uuid);
            dataMap.put("rsaPublicKey", publicKeyBase64);//将RSA公钥传给页面进行加密
            return R.ok(dataMap);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return R.fail("获取验证码失败");
        } finally {
            stream.close();
        }
    }

    @Log(operation="登录系统",remark = "系统用户进行登录",logType = 1,isSaveResData = false)//使用自定义的LogRecord注解记录操作日志，logType = 1表示这是一个登录日志
    @NotEmpty(value = {"username","password","captcha","uuid"},
            message = {"请输入用户名","请输入密码","请输入验证码","登录必须带上返回的uuid"})//使用自定义注解进行非空校验
    @PostMapping("/login")
    public R login(String username, String password, String captcha,String uuid){
        //从缓存中获取验证码
        String cacheCaptcha = cacheService.get(Constants.VERIFY_CODE + uuid,true);
        //校验验证码
        if(!captcha.equalsIgnoreCase(cacheCaptcha)){
            cacheService.remove(Constants.SECURITY.RSA_PRIVATE_KEY + uuid);
            return R.fail("验证码不正确");
        }
        //RSA解密密钥
        String privateKey = cacheService.get(Constants.SECURITY.RSA_PRIVATE_KEY + uuid,true);
        //已知私钥和密文，解密密文
        RSA rsa = new RSA(privateKey, null);
        String decryptPwd = rsa.decryptStr(password, KeyType.PrivateKey);
        //登录成功返回登录token
        TokenDTO token = sysUserService.login(username,decryptPwd);
        //登录成功，返回登录token
        return R.ok(token);
    }

    /**
     * 退出
     *
     */
    @Log(operation="退出系统",remark = "系统用户退出登录")//使用自定义的LogRecord注解记录操作日志
    @PostMapping("/logout")
    public R logout() {
        TokenDTO tokenDTO = getToken();
        //如果是使用jwt前后分离 只需要前端清除token即可
        if(tokenDTO.getType().equals(Constants.TOKEN_TYPE.SESSION)){
            sysUserService.logout(tokenDTO.getToken());
        }
        return R.ok();
    }

    /**
     * 获取登录用户信息
     * @return
     */
    @GetMapping("/login/user")
    public R getLoginUser(){
        LoginUser loginUser = getCurrLoginUser();
        return R.ok(loginUser);
    }

    /**
     * 刷新jwt验证Token
     * @param refreshToken
     * @return
     */
    @Log(operation="刷新Token",remark = "刷新jwt验证Token")
    @PostMapping("/auth/token/refresh")
    public R refreshAuthToken(String refreshToken){
        //刷新验证token
        TokenDTO token = sysUserService.refreshAuthToken(refreshToken);
        //返回新的token
        return R.ok(token);
    }
}
