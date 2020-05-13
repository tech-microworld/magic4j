package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.service.SysCnAreaService;
import com.itgacl.magic4j.modules.sys.vo.AreaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 *
 * @author 孤傲苍狼
 */
@RestController
@RequestMapping("/api/sys/cnArea")
public class SysCnAreaController extends SuperController {

    @Autowired
    private SysCnAreaService sysCnAreaService;

    /**
     * 创建
     * @param sysCnArea
     * @return
     */
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysCnAreaDTO sysCnArea){
        sysCnAreaService.create(sysCnArea);
        return R.ok();
    }

    /**
     * 更新
     * @param sysCnArea
     * @return
     */
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysCnAreaDTO sysCnArea){
        sysCnAreaService.update(sysCnArea);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysCnAreaDTO sysCnAreaDTO = sysCnAreaService.getSysCnAreaById(id);
        return R.ok(sysCnAreaDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @GetMapping
    public R get() {
        List<SysCnAreaDTO> sysCnAreaList = sysCnAreaService.getList(null);
        return R.ok(sysCnAreaList);
    }

    /**
     * 根据ID删除
     * @param id
     * @return
     * @throws Exception
     */
    @DeleteMapping("/{id}")
    public R delete(@PathVariable("id") Long id){
        sysCnAreaService.deleteById(id);
        return R.ok();
    }

    /**
     * 根据ID列表批量删除
     * ids=[18,19,20]
     * @return
     */
    @DeleteMapping
    public R delete(@RequestBody Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        sysCnAreaService.deleteByIds(idList);
        return R.ok();
    }

    /**
     * 获取区域树列表
     * @return
     */
    @GetMapping("/tree")
    public R geAreaTreeList(){
        List<AreaVo> areaVoList;
        //从缓存中读取
        String areaVoListStr = cacheService.get("areaTree",String.class);
        if(StrUtil.isEmpty(areaVoListStr)){
            areaVoList = sysCnAreaService.geAreaTreeList();
            cacheService.set("areaTree",JSON.toJSONString(areaVoList));
        }else {
            areaVoList = JSON.parseObject(areaVoListStr,new TypeReference<List<AreaVo>>(){});
        }
        return R.ok(TreeUtil.buildTree(areaVoList));
    }

    /**
     * 根据区域ID获取区域信息以及子区域信息
     * @param id
     * @return
     */
    @GetMapping("/tree/{id}")
    public R getAreaTreeById(@PathVariable("id") Long id) {
        List<AreaVo> areaVoList;
        //从缓存中读取
        String areaVoListStr = cacheService.get(id,String.class);
        if(StrUtil.isEmpty(areaVoListStr)){
            areaVoList = sysCnAreaService.geAreaTreeListById(id);
            cacheService.set(id,JSON.toJSONString(areaVoList));
        }else {
            areaVoList = JSON.parseObject(areaVoListStr,new TypeReference<List<AreaVo>>(){});
        }
        return R.ok(TreeUtil.buildTree(areaVoList));
    }

    @GetMapping("/tree/area/{id}")
    public R getTreeById(@PathVariable("id") Long id) {
        AreaVo areaVo;
        //从缓存中读取
        String areaJsonStr = cacheService.get(id,String.class);
        if(StrUtil.isEmpty(areaJsonStr)){
            areaVo = sysCnAreaService.getAreaTreeById(id);
            cacheService.set(id,JSON.toJSONString(areaVo));
        }else {
            areaVo = JSON.parseObject(areaJsonStr,AreaVo.class);
        }
        return R.ok(areaVo);
    }
}