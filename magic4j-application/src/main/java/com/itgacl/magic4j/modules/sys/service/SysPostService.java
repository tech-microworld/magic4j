package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.modules.sys.entity.SysPost;
import com.itgacl.magic4j.modules.sys.excel.PostExcel;
import com.itgacl.magic4j.modules.sys.vo.SysPostVo;

import java.util.List;

/**
 * @Classname SysPostService
 * @Description 岗位信息表 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
public interface SysPostService extends IService<SysPost> {

    void create(SysPostDTO sysPostDTO);

    void update(SysPostDTO sysPostDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysPostDTO getSysPostById(Long id);

    void deleteAll();

    List<SysPostDTO> getList(QueryWrapper<SysPost> queryWrapper);

    PageData<SysPostVo> pageList(Page<SysPost> page,QueryWrapper<SysPost> queryWrapper);

    void importPost(List<PostExcel> data, Boolean isCovered);
}
