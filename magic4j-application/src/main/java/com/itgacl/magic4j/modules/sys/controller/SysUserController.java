package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.common.cache.biz.BizCacheConstants;
import com.itgacl.magic4j.common.cache.sys.SysCache;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Encrypt;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.annotation.Cache;
import com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.dto.SysUserDTO;
import com.itgacl.magic4j.modules.sys.entity.*;
import com.itgacl.magic4j.modules.sys.excel.UserExcel;
import com.itgacl.magic4j.modules.sys.excel.UserImporter;
import com.itgacl.magic4j.modules.sys.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Api(tags = "系统用户管理")
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
    @ApiOperation("创建")
    @Encrypt(Encrypt.Type.AES) //数据使用AES加密后传输
    @Log(operation="创建用户",remark = "创建系统用户",moduleName = "系统用户")
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysUserDTO sysUser){
        sysUserService.create(sysUser);
        return R.ok();
    }

    /**
     * 更新
     * @param sysUser
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="更新用户",remark = "更新系统用户",moduleName = "系统用户")
    @CacheClear(key = "'" + BizCacheConstants.SYS.USER_ID + "' + #sysUser.id") //更新完成后清除缓存
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysUserDTO sysUser){
        sysUserService.update(sysUser);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找")
    @Auth(isAuth = false)//不进行权限控制
    @Cache(key = "'" + BizCacheConstants.SYS.USER_ID + "' + #id")//根据用户ID缓存
    @GetMapping("/{id}")
    public R<SysUserDTO> get(@PathVariable("id") Long id){
        SysUserDTO userDTO = sysUserService.getSysUserById(id);
        return R.ok(userDTO);
    }

    /**
     * 获取登录用户个人信息
     * @return
     */
    @ApiOperation("获取登录用户个人信息")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/profile")
    public R<SysUserDTO> profile(){
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
    @ApiOperation("修改密码")
    @Auth(isAuth = false)//不进行权限控制
    @Log(operation="修改密码",remark = "修改用户密码",moduleName = "系统用户")
    @Encrypt(Encrypt.Type.RSA)
    @PutMapping("/updatePwd")
    public R<Void> updatePwd(String oldPassword, String newPassword){
        sysUserService.updatePwd(getLoginUserId(),oldPassword,newPassword);
        return R.ok();
    }

    @ApiOperation("重置密码")
    @Log(operation="重置密码",remark = "重置用户密码",moduleName = "系统用户")
    @Encrypt(Encrypt.Type.RSA)
    @PutMapping("/resetPwd")
    public R<Void> resetPwd(Long userId,String password) {
        sysUserService.resetPwd(userId,password);
        return R.ok();
    }

    @ApiOperation("禁用用户")
    @Log(operation="禁用用户",remark = "根据用户id禁用用户",moduleName = "系统用户")
    @PutMapping("/forbid/{ids}")
    public R<Void> forbid(@PathVariable("ids") Long[] ids){
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

    @ApiOperation("恢复用户")
    @Log(operation="启用用户",remark = "根据用户id启用用户",moduleName = "系统用户")
    @PutMapping("/enable/{ids}")
    public R<Void> enable(@PathVariable("ids") Long[] ids){
        sysUserService.enableUser(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部用户")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysUserDTO>> get() {
        List<SysUserDTO> sysUserList = sysUserService.getList(null);
        return R.ok(sysUserList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除用户",remark = "根据用户ID删除系统用户",moduleName = "系统用户")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
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

    @ApiOperation("获取在线用户")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/online")
    public R<List<LoginUser>> online(){
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
    @ApiOperation("分页查询用户")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<SysUser>> pageList(SysUserDTO sysUserDTO, PageParam pageParam){
        //构建查询条件
        QueryWrapper<SysUser> queryWrapper = buildQueryWrapper(sysUserDTO);
        if(!isSuperAdminLogin()){//如果不是超级管理员登录，只能看到自己创建的
            queryWrapper.eq(SysUser.CREATE_USER,getLoginUserId());
        }
        Page<SysUser> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysUser> pageInfo = sysUserService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
    }

    /**
     * 导入用户
     */
    @ApiOperation("导入用户")
    @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖")
    @PostMapping("/import")
    public R<Void> importUser(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered) {
        UserImporter userImporter = new UserImporter(sysUserService, isCovered);
        ExcelUtil.save(file, userImporter, UserExcel.class);
        return R.success("导入成功");
    }

    /**
     * 导出用户
     */
    @ApiOperation("导出用户")
    @GetMapping("/export")
    public void export(SysUserDTO sysUserDTO, HttpServletResponse response) {
        //构建查询条件
        QueryWrapper<SysUser> queryWrapper = buildQueryWrapper(sysUserDTO);
        List<SysUser> sysUserList = sysUserService.list(queryWrapper);
        List<UserExcel> userExcelList = new ArrayList<>();
        if(CollectionUtil.isNotEmpty(sysUserList)){
            for (SysUser sysUser : sysUserList) {
                UserExcel userExcel = new UserExcel();
                BeanUtils.copyProperties(sysUser,userExcel);
                userExcel.setRoleName(sysUserRoleService.getUserRoleNames(sysUser.getId()));
                userExcel.setDeptName(SysCache.getDeptName(sysUser.getDeptId()));
                userExcel.setPostName(sysUserPostService.getUserPostNames(sysUser.getId()));
                userExcelList.add(userExcel);
            }
        }
        if(ArrayUtil.isNotEmpty(sysUserDTO.getExportColumnNames())){
            //导出Excel，指定需要导出的列
            ExcelUtil.export(response, "用户数据" + DateUtils.getCurrentTime(), "用户数据表", userExcelList, UserExcel.class,Arrays.asList(sysUserDTO.getExportColumnNames()));
        }else {
            //导出Excel，导出全部列
            ExcelUtil.export(response, "用户数据" + DateUtils.getCurrentTime(), "用户数据表", userExcelList, UserExcel.class);
        }

    }

    /**
     * 获取用户导入模板
     */
    @ApiOperation("获取用户导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<UserExcel> list = new ArrayList<>();
        ExcelUtil.export(response, "用户数据导入模板", "用户数据表", list, UserExcel.class);
    }

    /**
     * 获取租户用户列表
     * @return
     */
    @ApiOperation("分页查询租户用户列表")
    @GetMapping(value = "/tenant/user/list")
    public R<PageData<SysUser>> tenantUserList(SysUserDTO sysUserDTO,PageParam pageParam) {
        QueryWrapper<SysUser> queryWrapper = buildQueryWrapper(sysUserDTO);
        queryWrapper.eq(SysUser.DELETE_FLAG,Constants.DELETE_FLAG.NO);
        if(!isSuperAdminLogin()){//如果不是超级管理员登录，只能看到自己创建的
            queryWrapper.eq(SysUser.CREATE_USER,getLoginUserId());
        }
        if(!queryWrapper.getParamNameValuePairs().containsKey(SysUser.TENANT_ID)){
            queryWrapper.ne(SysUser.TENANT_ID,Constants.SUPER_TENANT_ID);//过滤系统默认租户用户
        }
        Page<SysUser> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysUser> pageInfo = sysUserService.pageList(page,queryWrapper);
        return R.ok(PageData.build(pageInfo));
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysUserDTO
     * @return
     */
    private QueryWrapper<SysUser> buildQueryWrapper(SysUserDTO sysUserDTO) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysUser.CREATE_TIME);
        if(StrUtil.isNotBlank(sysUserDTO.getUsername())){
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
        if(ArrayUtil.isNotEmpty(sysUserDTO.getUserIds())){
            queryWrapper.in(SysUser.ID,Arrays.asList(sysUserDTO.getUserIds()));
        }
        return queryWrapper;
    }

    /**
     * 获取编辑用户需要用到的信息
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/edit/info")
    public R<Map<Object, Object>> getEditUserInfo(Long id){
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

