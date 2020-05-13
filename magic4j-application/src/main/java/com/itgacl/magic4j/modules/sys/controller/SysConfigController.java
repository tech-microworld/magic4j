package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bizCache.BizCacheConstants;
import com.itgacl.magic4j.common.security.SecuritySetting;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.annotation.Cache;
import com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.modules.sys.dto.SysConfigDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.service.SysConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SysConfigController
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Auth(name = "系统配置")
@RestController
@RequestMapping(value = "/api/sys/config")
public class SysConfigController extends SuperController {

    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 创建
     * @param sysConfig
     * @return
     */
    @Log(operation="新增",remark = "新增配置",moduleName = "系统配置")
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysConfigDTO sysConfig){
        sysConfigService.create(sysConfig);
        return R.ok();
    }

    /**
     * 更新
     * @param sysConfig
     * @return
     */
    @Log(operation="修改",remark = "修改配置",moduleName = "系统配置")
    @CacheClear(key = "'" + BizCacheConstants.SYS.CONFIG_ID + "' + #sysConfig.id") //更新完成后清除缓存
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysConfigDTO sysConfig){
        sysConfigService.update(sysConfig);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    @Cache(key = "'" + BizCacheConstants.SYS.CONFIG_ID + "' + #id")//根据配置ID缓存
    public R get(@PathVariable("id") Long id){
        SysConfigDTO sysConfigDTO = sysConfigService.getSysConfigById(id);
        return R.ok(sysConfigDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysConfigDTO> sysConfigList = sysConfigService.getList(null);
        return R.ok(sysConfigList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除",remark = "根据ID删除配置",moduleName = "系统配置")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysConfigService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysConfigService.deleteByIds(idList);
        }
        return R.ok();
    }

    @Log(operation="刷新AES密钥",remark = "刷新AES密钥",moduleName = "系统配置")
    @PostMapping("/refreshAesSecretKey")
    public R refreshAesSecretKey(){
        sysConfigService.refreshAesSecretKey();
        return R.ok();
    }

    @Log(operation="刷新RSA密钥",remark = "刷新RSA密钥",moduleName = "系统配置")
    @PostMapping("/refreshRsaSecretKey")
    public R refreshRsaSecretKey(){
        sysConfigService.refreshRsaSecretKey();
        return R.ok();
    }


    /**
     * 根据Key查找配置
     * @param configKey
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/key/{configKey}")
    public R getConfigByType(@PathVariable("configKey")String configKey){
        SysConfig sysConfig = sysConfigService.query().eq(SysConfig.CONFIG_KEY, configKey).one();
        if(ObjectUtil.isNotEmpty(sysConfig)){
            SysConfigDTO sysConfigDTO = new SysConfigDTO();
            BeanUtils.copyProperties(sysConfig,sysConfigDTO);
            return R.ok(sysConfigDTO);
        }
       return R.ok();
    }

    @Log(operation="平台设置",remark = "保存平台设置",moduleName = "系统配置")
    @PostMapping("/platformSetting")
    public R platformSetting(String systemName,String systemLogo){
        sysConfigService.platformSetting(systemName,systemLogo);
        return R.ok();
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/platform")
    public R getPlatformConfig(){
        SysConfig platformConfig = sysConfigService.query().eq(SysConfig.CONFIG_KEY, "PlatformSetting").one();
        Map<String, Object> dataMap = new HashMap<>();
        if(ObjectUtil.isNotEmpty(platformConfig)){
            JSONObject jsonVal = JSON.parseObject(platformConfig.getConfigValue());
            dataMap.put("systemName", jsonVal.getString("systemName"));//系统名称
            dataMap.put("systemLogo", jsonVal.getString("systemLogo"));//系统logo
        }else {
            dataMap.put("systemName", "magic4j开发平台");//默认系统名称
            dataMap.put("systemLogo", "");//系统logo
        }
        return R.ok(dataMap);
    }

    @Log(operation="安全设置",remark = "保存安全设置",moduleName = "系统配置")
    @PostMapping("/security/set")
    public R saveSecuritySetting(@RequestBody SecuritySetting securitySetting){
        sysConfigService.saveSecuritySetting(securitySetting);
        return R.ok();
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/security/info")
    public R getSecuritySetting(){
        return R.ok(sysConfigService.getSecuritySetting());
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysConfigDTO sysConfigDTO){
        //构建查询条件
        QueryWrapper<SysConfig> queryWrapper = buildQueryWrapper(sysConfigDTO);
        Page<SysConfig> page = getPage();//获取mybatisPlus分页对象
        IPage<SysConfig> pageInfo = sysConfigService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysConfigDTO
     * @return
     */
    private QueryWrapper<SysConfig> buildQueryWrapper(SysConfigDTO sysConfigDTO) {
        QueryWrapper<SysConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysConfig.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysConfigDTO.getConfigName())){
            queryWrapper.like(SysConfig.CONFIG_NAME,sysConfigDTO.getConfigName());
        }
        if(StrUtil.isNotEmpty(sysConfigDTO.getConfigKey())){
            queryWrapper.like(SysConfig.CONFIG_KEY,sysConfigDTO.getConfigKey());
        }
        if(ObjectUtil.isNotEmpty(sysConfigDTO.getStatus())){
            queryWrapper.eq(SysConfig.STATUS,sysConfigDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(sysConfigDTO.getBeginTime())){
            queryWrapper.ge(SysConfig.CREATE_TIME,sysConfigDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(sysConfigDTO.getEndTime())){
            queryWrapper.le(SysConfig.CREATE_TIME,sysConfigDTO.getEndTime());
        }
        return queryWrapper;
    }
}