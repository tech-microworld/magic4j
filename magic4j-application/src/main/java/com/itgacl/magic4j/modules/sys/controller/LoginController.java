package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.VerifyCodeUtils;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.service.SysLogService;
import com.itgacl.magic4j.modules.sys.service.SysUserService;
import com.itgacl.magic4j.modules.sys.vo.CaptchaVo;
import com.itgacl.magic4j.modules.sys.vo.DashboardLineChartVo;
import com.itgacl.magic4j.modules.sys.vo.UserAreaMapVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;

@Api(tags = "系统登录")
@Slf4j
@RestController
@RequestMapping("/api")
public class LoginController extends SuperController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysLogService sysLogService;


    /**
     * 获取图片验证码
     * @throws IOException
     */
    @ApiOperation(value = "获取图片验证码")
    @GetMapping("/captchaImage")
    public R<CaptchaVo> captcha() throws IOException {
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
            CaptchaVo captchaVo = new CaptchaVo();
            captchaVo.setImg("data:image/gif;base64," + Base64.encode(stream.toByteArray()));
            captchaVo.setUuid(uuid);
            captchaVo.setVerifyCode(verifyCode);
            captchaVo.setRsaPublicKey(publicKeyBase64);//将RSA公钥传给页面进行加密
            return R.ok(captchaVo);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return R.fail("获取验证码失败");
        } finally {
            stream.close();
        }
    }

    @ApiOperation(value = "登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username",value = "用户名",required = true),
            @ApiImplicitParam(name = "password",value = "密码",required = true),
            @ApiImplicitParam(name = "captcha",value = "验证码",required = true),
            @ApiImplicitParam(name = "uuid",value = "获取验证码时返回的UUID",required = true)
    })
    @Log(operation="登录系统",remark = "系统用户进行登录",logType = 1,isSaveResData = false)//使用自定义的LogRecord注解记录操作日志，logType = 1表示这是一个登录日志
    @Validator(value = {"username","password","captcha","uuid"},
            message = {"请输入用户名","请输入密码","请输入验证码","登录必须带上返回的uuid"})//使用自定义注解进行非空校验
    @PostMapping("/login")
    public R<TokenDTO> login(String username, String password, String captcha, String uuid){
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
    @ApiOperation(value = "退出系统")
    @Log(operation="退出系统",remark = "系统用户退出登录")//使用自定义的LogRecord注解记录操作日志
    @PostMapping("/logout")
    public R<Void> logout() {
        TokenDTO tokenDTO = getToken();
        //如果是使用jwt前后分离 只需要前端清除token即可
        if(tokenDTO!=null && tokenDTO.getType().equals(Constants.TOKEN_TYPE.SESSION)){
            sysUserService.logout(tokenDTO.getToken());
        }
        return R.ok();
    }

    /**
     * 获取登录用户信息
     * @return
     */
    @ApiOperation(value = "获取登录用户信息")
    @GetMapping("/login/user")
    public R<LoginUser> getLoginUser(){
        LoginUser loginUser = getCurrLoginUser();
        return R.ok(loginUser);
    }

    /**
     * 刷新jwt验证Token
     * @param refreshToken
     * @return
     */
    @ApiOperation(value = "刷新jwt验证Token")
    @ApiImplicitParam(name = "refreshToken",value = "刷新Token",required = true)
    @Log(operation="刷新Token",remark = "刷新jwt验证Token")
    @PostMapping("/auth/token/refresh")
    public R<TokenDTO> refreshAuthToken(String refreshToken){
        //刷新验证token
        TokenDTO token = sysUserService.refreshAuthToken(refreshToken);
        //返回新的token
        return R.ok(token);
    }


    /**
     * 获取访问轨迹
     * @return
     */
    @ApiOperation(value = "获取访问轨迹地图数据")
    @GetMapping("/access/areaMap")
    public R<UserAreaMapVo> accessAreaMap(){
        QueryWrapper<SysLog> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .select(SysLog.CLIENT_IP,SysLog.CLIENT_OPERATION_LOCATION,SysLog.LNG,SysLog.LAT)
                .eq(SysLog.LOG_TYPE,1)
                .isNotNull(SysLog.CLIENT_IP);
        List<SysLog> logList = sysLogService.list(queryWrapper);
        Map<String,Set<String>> locationMap = new HashMap<>();
        Set<String> provinceSet = new HashSet<>();
        List<UserAreaMapVo.MapData> mapDataList = new ArrayList<>();
        List<UserAreaMapVo.ToolTipData> toolTipDataList = new ArrayList<>();
        if(CollectionUtil.isNotEmpty(logList)){
            logList.forEach(log->{
                if(StringUtils.isNotBlank(log.getClientOperationLocation())) {
                    String[] tmpStrArr = log.getClientOperationLocation().split("-");
                    String provinceName = "";
                    if (tmpStrArr.length > 0) {
                        provinceName = tmpStrArr[0];//获取到省份
                        if(provinceName.endsWith("省")){//为了匹配echarts地图省份数据做的数据处理
                            provinceName = provinceName.substring(0,provinceName.length()-1);
                        }else {
                            provinceName = provinceName.substring(0,2);
                        }
                        provinceSet.add(provinceName);
                    }
                }
            });
            provinceSet.forEach(province->{
                Set<String> cityAreaSet = new HashSet<>();
                logList.forEach(log->{
                    if(StringUtils.isNotBlank(log.getClientOperationLocation())){
                        String[] tmpStrArr = log.getClientOperationLocation().split("-");
                        String provinceName = "";
                        String cityArea = "";
                        if(tmpStrArr.length==1){//只获取到省份
                            provinceName = tmpStrArr[0];
                            cityArea = "未知区域";
                        }else if(tmpStrArr.length==2){//获取到的位置信息只包括到省份和城市
                            provinceName = tmpStrArr[0];
                            cityArea = tmpStrArr[1]+"-"+"未知区域";
                        }else if(tmpStrArr.length>2){//获取到的位置包括到省份和城市和地区
                            provinceName = tmpStrArr[0];
                            cityArea = tmpStrArr[1]+"-"+tmpStrArr[2];
                        }
                        if(StringUtils.isNotBlank(provinceName) && StringUtils.isNotBlank(cityArea)){
                            if(provinceName.endsWith("省")){
                                provinceName = provinceName.substring(0,provinceName.length()-1);
                            }else {
                                provinceName = provinceName.substring(0,2);
                            }
                            if(province.equals(provinceName)){
                                cityAreaSet.add(cityArea);
                                locationMap.put(province,cityAreaSet);
                            }
                        }
                    }
                });
            });

            for (Map.Entry<String, Set<String>> entry : locationMap.entrySet()) {
                UserAreaMapVo.MapData mapData = new UserAreaMapVo.MapData();
                UserAreaMapVo.ToolTipData toolTipData = new UserAreaMapVo.ToolTipData();
                String province = entry.getKey();
                Set<String> areaSet = entry.getValue();
                mapData.setName(province);
                toolTipData.setName(province);
                List<UserAreaMapVo.NV> valueList = new ArrayList<>();
                for (String area : areaSet) {
                    UserAreaMapVo.NV nv = new UserAreaMapVo.NV();
                    nv.setName(area);//区域名称
                    Integer areaCountVal = 0;//区域总访问次数统计

                    for (SysLog log : logList) {
                        if(StringUtils.isNotBlank(log.getClientOperationLocation())){
                            String cityArea = "";
                            String[] tmpStrArr = log.getClientOperationLocation().split("-");
                            if(tmpStrArr.length==1){//只获取到省份
                                cityArea = "未知区域";
                            }else if(tmpStrArr.length==2){//获取到的位置信息只包括到省份和城市
                                cityArea = tmpStrArr[1]+"-"+"未知区域";
                            }else if(tmpStrArr.length>2){//获取到的位置包括到省份和城市和地区
                                cityArea = tmpStrArr[1]+"-"+tmpStrArr[2];
                            }
                            if(cityArea.equals(area)){
                                areaCountVal++;//区域访问次数统计
                            }
                        }
                    }
                    nv.setValue(areaCountVal);
                    valueList.add(nv);
                }
                mapDataList.add(mapData);
                toolTipData.setValue(valueList);
                toolTipDataList.add(toolTipData);
            }
        }
        mapDataList.forEach(mapData -> {
            for (UserAreaMapVo.ToolTipData tipData : toolTipDataList) {
                if(mapData.getName().equals(tipData.getName())){
                    Integer provinceCount = 0;
                    List<UserAreaMapVo.NV> nvList = tipData.getValue();
                    for (UserAreaMapVo.NV nv : nvList) {
                        provinceCount+=nv.getValue();
                    }
                    mapData.setValue(provinceCount);
                }
            }
        });
        UserAreaMapVo accessAreaMapVo = new UserAreaMapVo();
        accessAreaMapVo.setToolTipDataList(toolTipDataList);
        accessAreaMapVo.setDataList(mapDataList);
        return R.ok(accessAreaMapVo);
    }

    /**
     * 获取7天内用户访问次数统计数据
     * @return
     */
    @ApiOperation(value = "获取7天内用户访问次数统计数据")
    @GetMapping("/login/statistic")
    public R<DashboardLineChartVo> loginStatistic(){
        DashboardLineChartVo lineChartVo = sysLogService.loginStatistic();
        return R.ok(lineChartVo);
    }
}
