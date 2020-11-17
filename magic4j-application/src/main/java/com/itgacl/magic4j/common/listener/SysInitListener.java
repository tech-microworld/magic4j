package com.itgacl.magic4j.common.listener;

import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.component.scan.AuthResourceScan;
import com.itgacl.magic4j.modules.sys.entity.SysDict;
import com.itgacl.magic4j.modules.sys.service.SysConfigService;
import com.itgacl.magic4j.modules.sys.service.SysDictService;
import com.itgacl.magic4j.modules.sys.service.SysResourceService;
import com.itgacl.magic4j.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 执行系统初始化操作
 */
@Component
@Slf4j
public class SysInitListener implements CommandLineRunner {

    @Autowired
    private CacheService cacheService;

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private AuthResourceScan authResourceScan;

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private SysDictService sysDictService;

    @Override
    public void run(String... strings) {
        //sysUserService.initSuperAdminUser();
        cacheDictData();//缓存字典数据
        List<AuthResourceScan.AuthRes> authResList = authResourceScan.scan();//扫描系统的权限控制资源
        sysResourceService.saveOrUpdate(authResList);
        sysConfigService.createRsaSecretKey();
        sysConfigService.createAesSecretKey();
    }

    /**
     *
     * 缓存字典数据
     */
    private void cacheDictData(){
        List<SysDict> dictList = sysDictService.query().select(SysDict.DICT_TYPE, SysDict.DICT_CODE, SysDict.DICT_LABEL).list();
        dictList.forEach(sysDict -> cacheService.set(sysDict.getDictType()+sysDict.getDictCode(),sysDict.getDictLabel()));
    }
}
