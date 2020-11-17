package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.cache.biz.BizCacheService;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.modules.sys.dto.SysFileDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.entity.SysFile;
import com.itgacl.magic4j.modules.sys.mapper.SysFileMapper;
import com.itgacl.magic4j.modules.sys.service.SysConfigService;
import com.itgacl.magic4j.modules.sys.service.SysFileService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname SysFileServiceImpl
 * @Description SysFileService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-25
 * @Version 1.0
 */
@Service
public class SysFileServiceImpl extends ServiceImpl<SysFileMapper, SysFile> implements SysFileService {

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private BizCacheService bizCacheService;

    /**
     * 上传文件
     * @param multipartFile
     * @return
     */
    @Override
    public UploadResult uploadFile(MultipartFile multipartFile) {
        UploadResult uploadResult = StorageFactory.build().uploadFile(multipartFile);
        if(uploadResult.isUploadSuccess()){
            SysFile sysFile = new SysFile();
            BeanUtils.copyProperties(uploadResult,sysFile);
            sysFile.setFileLength(uploadResult.getFileLength().intValue());
            save(sysFile);//保存文件
        }
        return uploadResult;
    }

    /**
     * 上传多个文件
     * @param multipartFileList
     * @return
     */
    @Override
    public List<UploadResult> uploadFile(List<MultipartFile> multipartFileList) {
        List<UploadResult> uploadResultList = StorageFactory.build().uploadFile(multipartFileList);
        uploadResultList.forEach(uploadResult -> {
            if(uploadResult.isUploadSuccess()){
                SysFile sysFile = new SysFile();
                BeanUtils.copyProperties(uploadResult,sysFile);
                sysFile.setFileLength(uploadResult.getFileLength().intValue());
                save(sysFile);//保存文件
            }
        });
        return uploadResultList;
    }

    @Override
    public UploadResult uploadNetworkFile(String fileUrl) {
        return uploadNetworkFile(fileUrl,null);
    }

    @Override
    public UploadResult uploadNetworkFile(String fileUrl, String fileExt) {
        UploadResult uploadResult = new UploadResult();
        try {
            if(StrUtil.isEmpty(fileExt)){
                uploadResult = StorageFactory.build().uploadNetworkFile(fileUrl);
            }else {
                uploadResult = StorageFactory.build().uploadNetworkFile(fileUrl,fileExt);
            }
            if(uploadResult.isUploadSuccess()){
                SysFile sysFile = new SysFile();
                BeanUtils.copyProperties(uploadResult,sysFile);
                sysFile.setFileLength(uploadResult.getFileLength().intValue());
                save(sysFile);//保存文件
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            uploadResult.setUploadSuccess(false);
        }
        return uploadResult;
    }

    @Override
    public void deleteById(Long id) {
        SysFile sysFile = getById(id);
        removeById(id);//逻辑删除
        ThreadUtil.execute(()->{
            StorageFactory.build(sysFile.getStorageType()).deleteFile(sysFile.getFileUrl());//删除文件服务器上的文件
        });
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        QueryWrapper<SysFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(SysFile.ID,idList);
        List<SysFileDTO> list = getList(queryWrapper);
        removeByIds(idList);//逻辑删除
        ThreadUtil.execute(()->{
            Map<String,List<String>> fileMap = new HashMap<>();
            list.forEach(file-> {
                List<String> fileUrlList = fileMap.get(file.getStorageType());
                if(CollectionUtil.isEmpty(fileUrlList)){
                    fileUrlList = new ArrayList<>();
                }
                fileUrlList.add(file.getFileUrl());
                fileMap.put(file.getStorageType(),fileUrlList);
            });
            fileMap.forEach((k,v)->{
                StorageFactory.build(k).deleteFile(v);//删除文件服务器上的文件
            });
        });
    }

    @Override
    public SysFileDTO getSysFileById(Long id) {
        SysFile sysFile = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysFile);
        SysFileDTO sysFileDTO = new SysFileDTO();
        BeanUtils.copyProperties(sysFile,sysFileDTO);
        return sysFileDTO;
    }

    @Override
    public List<SysFileDTO> getList(QueryWrapper<SysFile> queryWrapper) {
        List<SysFileDTO> sysFileDTOList = new ArrayList<>();
        List<SysFile> sysFileList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysFileList)){
            sysFileList.forEach(sysFile -> {
                SysFileDTO sysFileDTO = new SysFileDTO();
                BeanUtils.copyProperties(sysFile,sysFileDTO);
                sysFileDTOList.add(sysFileDTO);
            });
        }
        return sysFileDTOList;
    }

    @Override
    public void storageTypeSetting(String storageType) {
        SysConfig sysConfig = sysConfigService.getOne(new QueryWrapper<SysConfig>().eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.FILE_STORAGE_TYPE));
        sysConfig.setConfigValue(storageType);
        sysConfigService.updateById(sysConfig);//更新存储方式
        bizCacheService.setStorageType(storageType);//更新缓存中的存储方式
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysFileDTO> dataValidator = new DataValidator<SysFileDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysFileDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysFileDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysFileDTO data) {

        }
    };
}
