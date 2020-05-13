package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.bizCache.BizCacheConstants;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Encrypt;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.annotation.Cache;
import com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.dto.SysUserDTO;
import com.itgacl.magic4j.modules.sys.entity.*;
import com.itgacl.magic4j.modules.sys.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 *
 */
@Slf4j
@Auth(name = "系统用户")
@RestController
@RequestMapping("/api/sys/user")
public class SysUserController extends SuperController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysPostService sysPostService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysUserPostService sysUserPostService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 创建
     * @param sysUser
     * @return
     */
    @Encrypt(Encrypt.Type.AES) //数据使用AES加密后传输
    @Log(operation="创建用户",remark = "创建系统用户",moduleName = "系统用户")
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysUserDTO sysUser){
        sysUserService.create(sysUser);
        return R.ok();
    }

    /**
     * 更新
     * @param sysUser
     * @return
     */
    @Log(operation="更新用户",remark = "更新系统用户",moduleName = "系统用户")
    @CacheClear(key = "'" + BizCacheConstants.SYS.USER_ID + "' + #sysUser.id") //更新完成后清除缓存
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysUserDTO sysUser){
        sysUserService.update(sysUser);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @Cache(key = "'" + BizCacheConstants.SYS.USER_ID + "' + #id")//根据用户ID缓存
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysUserDTO userDTO = sysUserService.getSysUserById(id);
        return R.ok(userDTO);
    }

    /**
     * 登录用户个人信息
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/profile")
    public R profile(){
        LoginUser loginUser = getCurrLoginUser();
        SysUserDTO userDTO = sysUserService.getSysUserById(loginUser.getId());
        if(ObjectUtil.isNotEmpty(loginUser.getDeptId())){
            userDTO.setDeptName(bizCacheService.getDept(userDTO.getDeptId()).getDeptName());
        }
        userDTO.setRoleNames(loginUser.getRoleList().stream().map(LoginUser.Role::getRoleName).collect(Collectors.toList()));
        return R.ok(userDTO);
    }

    /**
     * Encrypt(Encrypt.Type.RSA)注解标识该方法的参数使用了RSA加密后传输
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @Log(operation="修改密码",remark = "修改用户密码",moduleName = "系统用户")
    @Encrypt(Encrypt.Type.RSA)
    @PutMapping("/updatePwd")
    public R updatePwd(String oldPassword, String newPassword){
        sysUserService.updatePwd(getLoginUserId(),oldPassword,newPassword);
        return R.ok();
    }

    @Log(operation="重置密码",remark = "重置用户密码",moduleName = "系统用户")
    @Encrypt(Encrypt.Type.RSA)
    @PutMapping("/resetPwd")
    public R resetPwd(Long userId,String password) {
        sysUserService.resetPwd(userId,password);
        return R.ok();
    }

    @Log(operation="禁用用户",remark = "根据用户id禁用用户",moduleName = "系统用户")
    @PutMapping("/forbid/{ids}")
    public R forbid(@PathVariable("ids") Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        if(idList.contains(getLoginUserId())){
            return R.fail("当前登录用户不能禁用");
        }
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(SysUser.ID,Arrays.asList(ids));
        SysUser sysUser = new SysUser();
        sysUser.setStatus(Constants.USER_STATUS.FROZEN);
        sysUserService.update(sysUser,queryWrapper);
        return R.ok();
    }

    @Log(operation="启用用户",remark = "根据用户id启用用户",moduleName = "系统用户")
    @PutMapping("/enable/{ids}")
    public R enable(@PathVariable("ids") Long[] ids){
        sysUserService.enableUser(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysUserDTO> sysUserList = sysUserService.getList(null);
        return R.ok(sysUserList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除用户",remark = "根据用户ID删除系统用户",moduleName = "系统用户")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        if(idList.contains(getLoginUserId())){
            return R.fail("当前登录用户不能删除");
        }
        if(ids.length==1){
            sysUserService.deleteById(ids[0]);
        }else {
            sysUserService.deleteByIds(idList);
        }
        return R.ok();
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/online")
    public R online(){
        List<LoginUser> loginUserList = new ArrayList<>();
        List<Object> cacheKeys = cacheService.getCacheKeys(Constants.LOGIN_USER.TOKEN_PREFIX);
        cacheKeys.forEach(key->{
            LoginUser loginUser = cacheService.get(key, LoginUser.class);
            if(ObjectUtil.isNotEmpty(loginUser)){
                loginUserList.add(loginUser);
            }
        });
        return R.ok(loginUserList);
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysUserDTO sysUserDTO){
        //构建查询条件
        QueryWrapper<SysUser> queryWrapper = buildQueryWrapper(sysUserDTO);
        if(!isSuperAdminLogin()){//如果不是超级管理员登录，只能看到自己创建的
            queryWrapper.eq(SysUser.CREATE_USER,getLoginUserId());
        }
        Page<SysUser> page = getPage();//获取mybatisPlus分页对象
        IPage<SysUser> pageInfo = sysUserService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 获取租户用户列表
     * @return
     */
    @GetMapping(value = "/tenant/user/list")
    public R tenantUserList(SysUserDTO sysUserDTO) {
        QueryWrapper<SysUser> queryWrapper = buildQueryWrapper(sysUserDTO);
        queryWrapper.eq(SysUser.DELETE_FLAG,Constants.DELETE_FLAG.NO);
        if(!isSuperAdminLogin()){//如果不是超级管理员登录，只能看到自己创建的
            queryWrapper.eq(SysUser.CREATE_USER,getLoginUserId());
        }
        if(!queryWrapper.getParamNameValuePairs().containsKey(SysUser.TENANT_ID)){
            queryWrapper.ne(SysUser.TENANT_ID,Constants.SUPER_TENANT_ID);//过滤系统默认租户用户
        }
        Page<SysUser> page = getPage();//获取mybatisPlus分页对象
        IPage<SysUser> pageInfo = sysUserService.pageList(page,queryWrapper);
        //分页信息
        Map<Object, Object> dataMap = Maps.builder()
                .put("total", pageInfo.getTotal())//总记录数
                .put("rows", pageInfo.getRecords())//列表数据
                .put("pages", pageInfo.getPages())//总页数
                .build();
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysUserDTO
     * @return
     */
    private QueryWrapper<SysUser> buildQueryWrapper(SysUserDTO sysUserDTO) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysUser.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysUserDTO.getUsername())){
            queryWrapper.like(SysUser.USERNAME,sysUserDTO.getUsername());
        }
        if(StrUtil.isNotEmpty(sysUserDTO.getCellphone())){
            queryWrapper.like(SysUser.CELLPHONE,sysUserDTO.getCellphone());
        }
        if(ObjectUtil.isNotEmpty(sysUserDTO.getStatus())){
            queryWrapper.eq(SysUser.STATUS,sysUserDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(sysUserDTO.getBeginTime())){
            queryWrapper.ge(SysUser.CREATE_TIME,sysUserDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(sysUserDTO.getEndTime())){
            queryWrapper.le(SysUser.CREATE_TIME,sysUserDTO.getEndTime());
        }
        if(ObjectUtil.isNotEmpty(sysUserDTO.getDeptId())){
            queryWrapper.eq(SysUser.DEPT_ID,sysUserDTO.getDeptId());
        }
        if(ObjectUtil.isNotEmpty(sysUserDTO.getTenantId())){
            queryWrapper.eq(SysUser.TENANT_ID,sysUserDTO.getTenantId());
            queryWrapper.getParamNameValuePairs().put(SysUser.TENANT_ID,sysUserDTO.getTenantId());
        }
        return queryWrapper;
    }

    /**
     * 获取编辑用户需要用到的信息
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/edit/info")
    public R getEditUserInfo(Long id){
        //1.获取岗位信息
        QueryWrapper<SysPost> sysPostQueryWrapper = new QueryWrapper<>();
        sysPostQueryWrapper.eq(SysPost.STATUS,0).orderByDesc(SysPost.ORDER_NUM);
        List<SysPostDTO> postDTOList = sysPostService.getList(sysPostQueryWrapper);

        //2.获取角色列表
        QueryWrapper<SysRole> sysRoleQueryWrapper = new QueryWrapper<>();
        if(!isSuperAdminLogin()){//如果不是超级管理员登录
            //过滤掉超级管理员
            sysRoleQueryWrapper.ne(SysRole.ROLE_CODE,Constants.SUPER_ADMIN_FLAG);
        }
        sysRoleQueryWrapper.orderByDesc(SysRole.CREATE_TIME);
        List<SysRoleDTO> roleDTOList = sysRoleService.getList(sysRoleQueryWrapper);
        Map<Object, Object> dataMap = Maps.builder()
                .put("roles", roleDTOList)//角色列表
                .put("posts", postDTOList)//岗位列表
                .build();
        if(ObjectUtil.isNotEmpty(id)){
            //3.如果传了用户Id，则要获取用户明细
            dataMap.put("userInfo",sysUserService.getSysUserById(id));
            List<SysUserPost> userPostList = sysUserPostService.query().select(SysUserPost.POST_ID).eq(SysUserPost.USER_ID, id).list();
            List<SysUserRole> userRoleList = sysUserRoleService.query().select(SysUserRole.ROLE_ID).eq(SysUserPost.USER_ID, id).list();
            dataMap.put("postIds",userPostList.stream().map(SysUserPost::getPostId).collect(Collectors.toList()));
            dataMap.put("roleIds",userRoleList.stream().map(SysUserRole::getRoleId).collect(Collectors.toList()));
        }
        return R.ok(dataMap);
    }
}

