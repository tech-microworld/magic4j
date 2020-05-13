package com.itgacl.magic4j.modules.sys.controller;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;

import com.itgacl.magic4j.modules.sys.dto.SysConfigDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.service.SysPostService;
import com.itgacl.magic4j.modules.sys.entity.SysPost;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;

import cn.hutool.core.collection.CollectionUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @Classname SysPostController
 * @Description 岗位信息表 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
@Auth(name = "岗位管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/sys/post")
public class SysPostController extends SuperController{

    @Autowired
    private SysPostService sysPostService;

    /**
     * 创建
     * @param sysPost
     * @return
     */
    @Log(operation="创建",remark = "创建岗位",moduleName = "岗位管理") //在方法上标注@Log注解用于记录操作日志
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysPostDTO sysPost){
        sysPostService.create(sysPost);
        return R.ok();
    }

    /**
     * 更新
     * @param sysPost
     * @return
     */
    @Log(operation="修改",remark = "修改岗位",moduleName = "岗位管理")
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysPostDTO sysPost){
        sysPostService.update(sysPost);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysPostDTO sysPostDTO = sysPostService.getSysPostById(id);
        return R.ok(sysPostDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysPostDTO> sysPostList = sysPostService.getList(null);
        return R.ok(sysPostList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除",remark = "根据ID删除岗位",moduleName = "岗位管理")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysPostService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysPostService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysPostDTO sysPostDTO){
        //构建查询条件
        QueryWrapper<SysPost> queryWrapper = buildQueryWrapper(sysPostDTO);
        Page<SysPost> page = getPage();//获取mybatisPlus分页对象
        IPage<SysPost> pageInfo = sysPostService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysPostDTO
     * @return
     */
    private QueryWrapper<SysPost> buildQueryWrapper(SysPostDTO sysPostDTO) {
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysPost.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysPostDTO.getPostName())){
            queryWrapper.like(SysPost.POST_NAME,sysPostDTO.getPostName());
        }
        if(StrUtil.isNotEmpty(sysPostDTO.getPostCode())){
            queryWrapper.like(SysPost.POST_CODE,sysPostDTO.getPostCode());
        }
        if(ObjectUtil.isNotEmpty(sysPostDTO.getStatus())){
            queryWrapper.eq(SysPost.STATUS,sysPostDTO.getStatus());
        }
        return queryWrapper;
    }
}