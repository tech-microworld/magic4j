package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.asymmetric.RSA;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.bizCache.BizCacheConstants;
import com.itgacl.magic4j.common.bizCache.BizCacheService;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.security.SecuritySetting;
import com.itgacl.magic4j.common.security.UserPasswordPolicy;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.libcommon.component.cache.annotation.Cache;
import com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.RandomUtils;
import com.itgacl.magic4j.modules.sys.dto.SysConfigDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.mapper.SysConfigMapper;
import com.itgacl.magic4j.modules.sys.service.SysConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * SysConfigService 实现类
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements SysConfigService {

    @Autowired
    private BizCacheService bizCacheService;

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @Override
    public void create(SysConfigDTO sysConfigDTO) {
        dataValidator.validate(sysConfigDTO);//业务处理校验
        SysConfig sysConfig = new SysConfig();
        BeanUtils.copyProperties(sysConfigDTO,sysConfig);
        save(sysConfig);//保存
    }

    @Override
    public void update(SysConfigDTO sysConfigDTO) {
        dataValidator.validate(sysConfigDTO);//业务处理校验
        SysConfig sysConfig = new SysConfig();
        BeanUtils.copyProperties(sysConfigDTO,sysConfig);
        updateById(sysConfig);
    }
 
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
    }

    @Override
    public SysConfigDTO getSysConfigById(Long id) {
        SysConfig sysConfig = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysConfig);
        SysConfigDTO sysConfigDTO = new SysConfigDTO();
        BeanUtils.copyProperties(sysConfig,sysConfigDTO);
        return sysConfigDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysConfigDTO> getList(QueryWrapper<SysConfig> queryWrapper) {
        List<SysConfigDTO> sysConfigDTOList = new ArrayList<>();
        List<SysConfig> sysConfigList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysConfigList)){
            sysConfigList.forEach(sysConfig -> {
                SysConfigDTO sysConfigDTO = new SysConfigDTO();
                BeanUtils.copyProperties(sysConfig,sysConfigDTO);
                sysConfigDTOList.add(sysConfigDTO);
            });
        }
        return sysConfigDTOList;
    }

    /**
     * 生成16位的AES加密密钥
     */
    @Override
    public void createAesSecretKey() {
        //生成16位AES加密密钥
        String aesSecretKey = RandomUtils.generateMixString(16);//最长只能16位
        SysConfigDTO sysConfig = new SysConfigDTO();
        sysConfig.setConfigName("AES加密密钥");
        sysConfig.setConfigKey(Constants.SYS_CONFIG_KEY.AES_SECRET_KEY);
        sysConfig.setConfigValue(aesSecretKey);
        sysConfig.setStatus(0);//显示
        sysConfig.setRemark("对称加密指加密和解密使用相同密钥的加密算法，AES全称高级加密标准（英语：Advanced Encryption Standard，缩写：AES），在密码学中又称Rijndael加密法。\n" +
                "\n" +
                "对于Java中AES的默认模式是：AES/ECB/PKCS5Padding，如果使用CryptoJS，请调整为：padding: CryptoJS.pad.Pkcs7");
        try {
            create(sysConfig);
            //将AES密钥存放到缓存中
            bizCacheService.saveAesSecretKey(aesSecretKey);
        }catch (Exception e){
            log.warn(e.getMessage());
        }
    }

    /**
     * 生成RSA加密秘钥
     */
    @Override
    public void createRsaSecretKey() {
        RSA rsa = new RSA();
        String privateKeyBase64 = rsa.getPrivateKeyBase64();
        String publicKeyBase64 = rsa.getPublicKeyBase64();
        SysConfigDTO sysConfig = new SysConfigDTO();
        sysConfig.setConfigName("RSA加密密钥");
        sysConfig.setConfigKey(Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(Constants.SYS_CONFIG_KEY.PRIVATE_KEY, privateKeyBase64);
        jsonObject.put(Constants.SYS_CONFIG_KEY.PUBLIC_KEY, publicKeyBase64);
        sysConfig.setConfigValue(jsonObject.toJSONString());
        sysConfig.setStatus(0);//显示
        sysConfig.setRemark("非对称加密有公钥和私钥两个概念，私钥自己拥有，不能给别人，公钥公开。根据应用的不同，我们可以选择使用不同的密钥加密：\n" +
                "\n" +
                "签名：使用私钥加密，公钥解密。用于让所有公钥所有者验证私钥所有者的身份并且用来防止私钥所有者发布的内容被篡改，但是不用来保证内容不被他人获得。\n" +
                "\n" +
                "加密：用公钥加密，私钥解密。用于向公钥所有者发布信息,这个信息可能被他人篡改,但是无法被他人获得。");
        try {
            create(sysConfig);
            bizCacheService.saveRsaSecretKey(privateKeyBase64, publicKeyBase64);
        } catch (Exception e) {
            log.warn(e.getMessage());
        }
    }

    @Override
    public void refreshAesSecretKey() {
        bizCacheService.cleanAesSecretKey();//清理缓存中的AES密钥
        QueryWrapper<SysConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(SysConfig.CONFIG_KEY,Constants.SYS_CONFIG_KEY.AES_SECRET_KEY);
        remove(queryWrapper);//删除旧的AES密钥
        createAesSecretKey();//创建新的AES密钥
    }

    @Override
    public void refreshRsaSecretKey() {
        bizCacheService.cleanRsaSecretKey();//清理缓存中的RSA密钥
        QueryWrapper<SysConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(SysConfig.CONFIG_KEY,Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR);
        remove(queryWrapper);//删除旧的RSA密钥
        createRsaSecretKey();//创建新的RSA密钥
    }

    @CacheClear(key = BizCacheConstants.SECURITY_SETTING_CACHE)//清除缓存
    @Override
    public void saveSecuritySetting(SecuritySetting securitySetting) {
        UserPasswordPolicy passwordPolicy = securitySetting.getPasswordPolicy();
        String lengthRule;
        String characterRule = "";
        if(isPositiveInteger(passwordPolicy.getMinimumUppercaseLetters())){
            characterRule += MessageFormat.format("{0}个大写字母，",passwordPolicy.getMinimumUppercaseLetters());
        }
        if(isPositiveInteger(passwordPolicy.getMinimumLowercaseLetters())){
            characterRule += MessageFormat.format("{0}个小写字母，",passwordPolicy.getMinimumLowercaseLetters());
        }
        if(isPositiveInteger(passwordPolicy.getMinimumDigits())){
            characterRule += MessageFormat.format("{0}个数字，",passwordPolicy.getMinimumDigits());
        }
        if(isPositiveInteger(passwordPolicy.getMinimumSpecialCharacters())){
            characterRule += MessageFormat.format("{0}个特殊字符",passwordPolicy.getMinimumSpecialCharacters());
        }
        if(passwordPolicy.getMinimumLength().equals(passwordPolicy.getMaximumLength())){
            lengthRule = MessageFormat.format("密码长度必须是{0}位数",passwordPolicy.getMinimumLength());
        }else {
            lengthRule = MessageFormat.format("密码长度最少{0}位，最多{1}位",passwordPolicy.getMinimumLength(),passwordPolicy.getMaximumLength());
        }
        if(StrUtil.isNotEmpty(characterRule)){
            passwordPolicy.setPasswordPolicyDesc(lengthRule+"，至少包含："+characterRule);
        }else {
            passwordPolicy.setPasswordPolicyDesc(lengthRule);
        }

        SysConfig sysConfig = query().eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.SECURITY_SETTING).one();
        if(ObjectUtil.isNotEmpty(sysConfig)){
            sysConfig.setConfigValue(JSON.toJSONString(securitySetting));
            updateById(sysConfig);
        }else {
            SysConfigDTO sysConfigDTO = new SysConfigDTO();
            sysConfigDTO.setConfigName("安全设置");
            sysConfigDTO.setConfigKey(Constants.SYS_CONFIG_KEY.SECURITY_SETTING);
            sysConfigDTO.setConfigValue(JSON.toJSONString(securitySetting));
            sysConfigDTO.setStatus(0);//正常
            create(sysConfigDTO);
        }
    }

    @Cache(key = BizCacheConstants.SECURITY_SETTING_CACHE)//缓存查询结果
    @Override
    public SecuritySetting getSecuritySetting() {
        SysConfig sysConfig = query().eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.SECURITY_SETTING).one();
        SecuritySetting securitySetting;
        if(ObjectUtil.isNotEmpty(sysConfig)) {
            String configVal = sysConfig.getConfigValue();
            securitySetting = JSONObject.parseObject(configVal, SecuritySetting.class);
        }else {
            securitySetting = new SecuritySetting();
            securitySetting.setPasswordPolicy(new UserPasswordPolicy());
            securitySetting.getPasswordPolicy().setMinimumLength(6);
            securitySetting.getPasswordPolicy().setMaximumLength(30);
        }
        return securitySetting;
    }

    @Override
    public SysConfig getConfigByKey(String key) {
        return sysConfigMapper.getConfigByKey(key);
    }

    @Override
    public void platformSetting(String systemName, String systemLogo) {
        SysConfig sysConfig = query().eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.PLATFORM_SETTING).one();
        if(ObjectUtil.isNotEmpty(sysConfig)){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("systemName",systemName);
            jsonObject.put("systemLogo",systemLogo);
            sysConfig.setConfigValue(jsonObject.toJSONString());
            updateById(sysConfig);
        }else {
            SysConfigDTO platformConfig = new SysConfigDTO();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("systemName",systemName);
            jsonObject.put("systemLogo",systemLogo);
            platformConfig.setConfigName("平台设置");
            platformConfig.setConfigKey("PlatformSetting");
            platformConfig.setConfigValue(jsonObject.toJSONString());
            create(platformConfig);
        }

    }

    private boolean isPositiveInteger(Integer val) {
        return val != null && val > 0;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysConfigDTO> dataValidator = new DataValidator<SysConfigDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysConfigDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysConfigDTO data) {
            Integer count = query().eq(SysConfig.CONFIG_KEY, data.getConfigKey()).count();
            AssertUtil.isTrue(ErrorCodeEnum.DATA_EXIST, count == 0);
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysConfigDTO data) {
            SysConfig sysConfig = query().eq(SysConfig.CONFIG_KEY, data.getConfigKey()).one();
            if(sysConfig != null){
                AssertUtil.equals(ErrorCodeEnum.DATA_EXIST,sysConfig.getId(),data.getId());
            }
        }
    };
}
