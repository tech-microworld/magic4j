package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysUserPostDTO;
import com.itgacl.magic4j.modules.sys.entity.SysUserPost;

import java.util.List;

/**
 * @Classname SysUserPostService
 * @Description 用户与岗位关联表 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-08
 * @Version 1.0
 */
public interface SysUserPostService extends IService<SysUserPost> {

    void create(SysUserPostDTO sysUserPostDTO);

    void update(SysUserPostDTO sysUserPostDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysUserPostDTO getSysUserPostById(Long id);

    void deleteAll();

    List<SysUserPostDTO> getList(QueryWrapper queryWrapper);

    void bindPost(Long sysUserId, List<Long> postIds);

    String getUserPostNames(Long sysUserId);
}
