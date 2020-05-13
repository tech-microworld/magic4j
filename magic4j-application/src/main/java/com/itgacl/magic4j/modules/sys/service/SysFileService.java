package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.modules.sys.dto.SysFileDTO;
import com.itgacl.magic4j.modules.sys.entity.SysFile;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Classname SysFileService
 * @Description 测速文件管理 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-25
 * @Version 1.0
 */
public interface SysFileService extends IService<SysFile> {

    UploadResult uploadFile(MultipartFile multipartFile);

    List<UploadResult> uploadFile(List<MultipartFile> multipartFileList);

    UploadResult uploadNetworkFile(String fileUrl);

    UploadResult uploadNetworkFile(String fileUrl,String fileExt);

    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysFileDTO getSysFileById(Long id);

    List<SysFileDTO> getList(QueryWrapper<SysFile> queryWrapper);

    void storageTypeSetting(String storageType);
}
