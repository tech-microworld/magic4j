package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.entity.SysUser;
import com.itgacl.magic4j.modules.sys.service.SysRoleService;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author 孤傲苍狼
 */
@Api(tags = "系统角色")
@Auth(name = "系统角色")
@RestController
@RequestMapping("/api/sys/role")
public class SysRoleController extends SuperController {

    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 创建
     * @param sysRole
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建角色",moduleName = "系统角色")
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysRoleDTO sysRole){
        sysRoleService.create(sysRole);
        return R.ok();
    }

    /**
     * 更新
     * @param sysRole
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改角色",moduleName = "系统角色")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysRoleDTO sysRole){
        sysRoleService.update(sysRole);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R<SysRoleDTO> get(@PathVariable("id") Long id){
        SysRoleDTO sysRoleDTO = sysRoleService.getSysRoleById(id);
        return R.ok(sysRoleDTO);
    }

    /**
     * 根据条件查询
     * @return
     */
    @ApiOperation("根据条件查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysRoleDTO>> get(SysRoleDTO sysRoleDTO) {
        QueryWrapper<SysRole> queryWrapper = buildQueryWrapper(sysRoleDTO);
        List<SysRoleDTO> sysRoleList = sysRoleService.getList(queryWrapper);
        return R.ok(sysRoleList);
    }

    /**
     * 根据ID删除
     * @param ids
     * @return
     */
    @ApiOperation("根据ID删除")
    @Log(operation="删除",remark = "根据ID删除",moduleName = "系统角色")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysRoleService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysRoleService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 为角色授权
     * @return
     */
    @ApiOperation("为角色授权")
    @Log(operation="授权",remark = "为角色授权访问资源",moduleName = "系统角色")
    @PutMapping("/{id}/res")
    public R<Void> authorize(@PathVariable("id") Long id, @RequestBody @NotEmpty(message = "资源ID不能为空") List<Long> resIds){
        sysRoleService.bindResource(id,resIds);
        return R.ok();
    }

    /**
     * 获取用户所担任的角色
     * @param sysUserId
     * @return
     */
    @ApiOperation("获取用户所担任的角色列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{sysUserId}/role")
    public R<List<SysRole>> getUserRoleList(@PathVariable("sysUserId") Long sysUserId){
        List<SysRole> sysRoleList = sysRoleService.getUserRoleList(sysUserId);
        return R.ok(sysRoleList);
    }

    /**
     * 获取角色所拥有的资源
     * @return
     */
    @ApiOperation("获取角色所拥有的资源")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}/res")
    public R<List<SysResourceVo>> getRoleResList(@PathVariable("id") Long id) {
        List<SysResourceVo> roleResList = sysRoleService.getRoleResList(id,null);
        return R.ok(roleResList);
    }

    /**
     * 获取角色所拥有的资源树
     * @return
     */
    @ApiOperation("获取角色所拥有的资源树")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}/res/tree")
    public R<List<SysResourceVo>> getRoleResTreeList(@PathVariable("id") Long id) {
        List<SysResourceVo> roleResList = sysRoleService.getRoleResList(id,null);
        return R.ok(TreeUtil.buildTree(roleResList));
    }

    /**
     * 根据条件分页查询
     * @return
     */
    @ApiOperation("根据条件分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/list")
    public R<PageData<SysRole>> pageList(SysRoleDTO sysRoleDTO, PageParam pageParam) {
        QueryWrapper<SysRole> queryWrapper = buildQueryWrapper(sysRoleDTO);
        if(!isSuperAdminLogin()){//如果不是超级管理员登录，只能看到自己创建的
            queryWrapper.eq(SysUser.CREATE_USER,getLoginUserId());
        }
        Page<SysRole> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysRole> pageInfo = sysRoleService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
    }

    /**
     * 构建用户查询条件QueryWrapper
     * @param roleDTO
     * @return
     */
    private QueryWrapper<SysRole> buildQueryWrapper(SysRoleDTO roleDTO) {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysRole.CREATE_TIME);
        if(StrUtil.isNotEmpty(roleDTO.getRoleName())){
            queryWrapper.like(SysRole.ROLE_NAME,roleDTO.getRoleName());
        }
        if(StrUtil.isNotEmpty(roleDTO.getRoleCode())){
            queryWrapper.like(SysRole.ROLE_CODE,roleDTO.getRoleCode());
        }
        if(ObjectUtil.isNotEmpty(roleDTO.getCreateUser())){
            queryWrapper.eq(SysUser.CREATE_USER,roleDTO.getCreateUser());
        }
        if(ObjectUtil.isNotEmpty(roleDTO.getBeginTime())){
            queryWrapper.ge(SysRole.CREATE_TIME,roleDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(roleDTO.getEndTime())){
            queryWrapper.le(SysRole.CREATE_TIME,roleDTO.getEndTime());
        }
        return queryWrapper;
    }
}