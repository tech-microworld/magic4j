package com.itgacl.magic4j.libcommon.component.storage;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Db;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.component.storage.enums.StorageTypeEnum;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import com.itgacl.magic4j.libcommon.component.storage.service.impl.*;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;

import javax.sql.DataSource;

public class StorageFactory {

    public static StorageService build(StorageTypeEnum storageType){
        StorageService storageService;
        if(StorageTypeEnum.ALIYUN_OSS.getType() == storageType.getType()){
            storageService = SpringContextUtils.getBean(AliyunOssStorageServiceImpl.class);
        }else if(StorageTypeEnum.TENCENT_COS.getType() == storageType.getType()){
            storageService = SpringContextUtils.getBean(TencentCosStorageServiceImpl.class);
        }else if(StorageTypeEnum.QINIU_KODO.getType() == storageType.getType()){
            storageService = SpringContextUtils.getBean(QiniuKodoStorageServiceImpl.class);
        }else if(StorageTypeEnum.FASTDFS.getType() == storageType.getType()){
            storageService = SpringContextUtils.getBean(FastdfsStorageServiceImpl.class);
        }else if(StorageTypeEnum.LOCAL.getType() == storageType.getType()){
            storageService = SpringContextUtils.getBean(LocalStorageServiceImpl.class);
        }else {
            //默认实现
            storageService = SpringContextUtils.getBean(SftpStorageServiceImpl.class);
        }
        return storageService;
    }

    public static StorageService build(){
        return build("");
    }

    public static StorageService build(String storageType){
        StorageService storageService;
        CacheService cacheService = SpringContextUtils.getBean(CacheService.class);
        if(StrUtil.isEmpty(storageType)){
            //获取文件存储方式
            storageType = cacheService.get(Constants.STORAGE_TYPE, () -> {
                // 通过DB获取默认存储方式
                DataSource dataSource = SpringContextUtils.getBean(DataSource.class);
                try {
                    return Db.use(dataSource).queryString("SELECT config_value FROM sys_config WHERE config_key=? AND status=0 AND delete_flag=0", Constants.SYS_CONFIG_KEY.FILE_STORAGE_TYPE);
                } catch (Exception e) {
                    return null;
                }
            });
        }

        if(StorageTypeEnum.ALIYUN_OSS.getDescription().equalsIgnoreCase(storageType)){
            storageService = SpringContextUtils.getBean(AliyunOssStorageServiceImpl.class);
        }else if(StorageTypeEnum.TENCENT_COS.getDescription().equalsIgnoreCase(storageType)){
            storageService = SpringContextUtils.getBean(TencentCosStorageServiceImpl.class);
        }else if(StorageTypeEnum.QINIU_KODO.getDescription().equalsIgnoreCase(storageType)){
            storageService = SpringContextUtils.getBean(QiniuKodoStorageServiceImpl.class);
        }else if(StorageTypeEnum.FASTDFS.getDescription().equalsIgnoreCase(storageType)){
            storageService = SpringContextUtils.getBean(FastdfsStorageServiceImpl.class);
        }else if(StorageTypeEnum.LOCAL.getDescription().equalsIgnoreCase(storageType)){
            storageService = SpringContextUtils.getBean(LocalStorageServiceImpl.class);
        }else {
            //默认实现
            storageService = SpringContextUtils.getBean(SftpStorageServiceImpl.class);
        }
        return storageService;
    }
}
