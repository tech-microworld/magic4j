package com.itgacl.magic4j.modules.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.modules.demo.dto.MiniappUserDTO;
import com.itgacl.magic4j.modules.demo.vo.MiniappUserVo;
import com.itgacl.magic4j.modules.demo.entity.MiniappUser;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.List;

/**
 * @Classname MiniappUserService
 * @Description 微信小程序用户信息表 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
public interface MiniappUserService extends IService<MiniappUser> {

    void create(MiniappUserDTO miniappUserDTO);

    void update(MiniappUserDTO miniappUserDTO);

    void importData(List<MiniappUserDTO> dataList, Boolean isCovered);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    MiniappUserVo getMiniappUserById(Long id);

    void delete(QueryWrapper<MiniappUser> queryWrapper);

    void deleteAll();

    List<MiniappUserVo> getList(QueryWrapper<MiniappUser> queryWrapper);

    PageData<MiniappUserVo> pageList(Page<MiniappUser> page, QueryWrapper<MiniappUser> queryWrapper);

    PageData<MiniappUserVo> pageList(PageParam pageParam, QueryWrapper<MiniappUser> queryWrapper);
}
