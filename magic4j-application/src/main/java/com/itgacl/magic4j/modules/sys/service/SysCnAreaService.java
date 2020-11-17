package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.libcommon.bean.TreeNode;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.query.SysCnAreaQuery;
import com.itgacl.magic4j.modules.sys.vo.AreaTreeVo;
import com.itgacl.magic4j.modules.sys.vo.SysCnAreaVo;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.List;

/**
 * @Classname SysCnAreaService
 * @Description 中国行政区域 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
public interface SysCnAreaService extends IService<SysCnArea> {

    void create(SysCnAreaDTO sysCnAreaDTO);

    void update(SysCnAreaDTO sysCnAreaDTO);

    void importData(List<SysCnAreaDTO> dataList, Boolean isCovered);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysCnAreaVo getSysCnAreaById(Long id);

    void delete(QueryWrapper<SysCnArea> queryWrapper);

    void deleteAll();

    List<SysCnAreaVo> getList(QueryWrapper<SysCnArea> queryWrapper);

    PageData<SysCnAreaVo> pageList(Page<SysCnArea> page, QueryWrapper<SysCnArea> queryWrapper);

    PageData<SysCnAreaVo> pageList(PageParam pageParam, QueryWrapper<SysCnArea> queryWrapper);

    List<AreaTreeVo> geAreaTreeList();

    List<AreaTreeVo> getAreaTreeListById(Long id);

    /**
     * 根据ID获取父节点列表
     * @param id
     * @return
     */
    List<AreaTreeVo> getParentAreaTreeListById(Long id);

    AreaTreeVo getAreaTreeById(Long id);

    List<AreaTreeVo> getAreaTree(SysCnAreaQuery query);
}
