package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.common.security.SecuritySetting;
import com.itgacl.magic4j.modules.sys.dto.SysConfigDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * SysConfigService
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysConfigService extends IService<SysConfig> {

    void create(SysConfigDTO sysConfigDTO);

    void update(SysConfigDTO sysConfigDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysConfigDTO getSysConfigById(Long id);

    void deleteAll();

    List<SysConfigDTO> getList(QueryWrapper<SysConfig> queryWrapper);

    void createAesSecretKey();

    void createRsaSecretKey();

    void refreshAesSecretKey();

    void refreshRsaSecretKey();

    void saveSecuritySetting(SecuritySetting securitySetting);

    SecuritySetting getSecuritySetting();

    SysConfig getConfigByKey(String key);

    void platformSetting(String systemName,String systemLogo);
}
