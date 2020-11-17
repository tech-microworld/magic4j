package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.cache.biz.BizCacheService;
import com.itgacl.magic4j.common.cache.sys.SysCache;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.jwt.JwtConfig;
import com.itgacl.magic4j.common.jwt.JwtToken;
import com.itgacl.magic4j.common.jwt.JwtTokenFactory;
import com.itgacl.magic4j.common.security.SecuritySetting;
import com.itgacl.magic4j.common.security.UserPasswordPolicy;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.libcommon.component.api.bean.AddressInfo;
import com.itgacl.magic4j.libcommon.component.api.service.CommApiService;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.exception.DataValidationException;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.libcommon.util.GUIDUtil;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.libcommon.util.ip.IpUtils;
import com.itgacl.magic4j.modules.sys.dto.SysUserDTO;
import com.itgacl.magic4j.modules.sys.dto.SysUserRoleDTO;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.entity.SysUser;
import com.itgacl.magic4j.modules.sys.excel.UserExcel;
import com.itgacl.magic4j.modules.sys.mapper.SysUserMapper;
import com.itgacl.magic4j.modules.sys.service.*;
import eu.bitwalker.useragentutils.UserAgent;
import org.apache.commons.lang3.RandomStringUtils;
import org.passay.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 *
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private static final String LAST_LOGIN_TS = "lastLoginTs";
    private static final String FAILED_LOGIN_ATTEMPTS = "failedLoginAttempts";

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private JwtTokenFactory jwtTokenFactory;

    @Autowired
    private BizCacheService bizCacheService;

    @Autowired
    private SysUserPostService sysUserPostService;

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private CommApiService commApiService;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Transactional
    @Override
    public Long create(SysUserDTO sysUserDTO) {
        dataValidator.validate(sysUserDTO);//业务处理校验
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(sysUserDTO,sysUser);
        if(sysUser.getStatus() == null) {
            sysUser.setStatus(Constants.USER_STATUS.NORMAL);
        }
        if(sysUser.getTenantId() == null){
            sysUser.setTenantId(LoginUserContext.get().getTenantId());
        }
        //生成20位长度的随机数，用作密码加密的盐
        String salt = RandomStringUtils.randomAlphanumeric(20);
        //将密码和盐使用sha256加密
        sysUser.setPassword(SecureUtil.sha256(sysUser.getPassword() + salt));
        sysUser.setSalt(salt);
        save(sysUser);//保存用户
        if(ArrayUtil.isNotEmpty(sysUserDTO.getRoleIds())){
            sysUserRoleService.bindRole(sysUser.getId(), Arrays.asList(sysUserDTO.getRoleIds()));
        }
        if(ArrayUtil.isNotEmpty(sysUserDTO.getPostIds())){
            sysUserPostService.bindPost(sysUser.getId(), Arrays.asList(sysUserDTO.getPostIds()));
        }
        return sysUser.getId();//保存成功后返回主键id
    }

    @Transactional
    @Override
    public void update(SysUserDTO sysUserDTO) {
        dataValidator.validate(sysUserDTO);//业务处理校验
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(sysUserDTO,sysUser);
        if(StrUtil.isNotEmpty(sysUser.getPassword())){
            //修改密码的同时，把用于密码加密的盐也一起修改
            //生成20位长度的随机数，用作密码加密的盐
            String salt = RandomStringUtils.randomAlphanumeric(20);
            //将密码使用sha256加密
            sysUser.setPassword(SecureUtil.sha256(sysUserDTO.getPassword() + salt));
            sysUser.setSalt(salt);
        }else {
            sysUser.setPassword(null);//避免由于密码为空字符串导致原来的密码被清空
        }
        updateById(sysUser);
        if(ArrayUtil.isNotEmpty(sysUserDTO.getRoleIds())){
            sysUserRoleService.bindRole(sysUser.getId(), Arrays.asList(sysUserDTO.getRoleIds()));
        }
        if(ArrayUtil.isNotEmpty(sysUserDTO.getPostIds())){
            sysUserPostService.bindPost(sysUser.getId(), Arrays.asList(sysUserDTO.getPostIds()));
        }
    }

    @Override
    public void deleteById(Long id) {
        removeById(id);
    }

    @Override
    public void deleteAll() {
        remove(null);
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
    }

    @Override
    public SysUserDTO getSysUserById(Long id) {
        SysUser sysUser = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.USER_NOT_FOUND,sysUser);
        SysUserDTO sysUserDTO = new SysUserDTO();
        BeanUtils.copyProperties(sysUser,sysUserDTO);
        return sysUserDTO;
    }

    @Override
    public List<SysUserDTO> getList(QueryWrapper<SysUser> queryWrapper) {
        List<SysUserDTO> sysUserDTOList = new ArrayList<>();
        List<SysUser> sysUserList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysUserList)){
            sysUserList.forEach(sysUser -> {
                SysUserDTO sysUserDTO = new SysUserDTO();
                BeanUtils.copyProperties(sysUser,sysUserDTO);
                sysUserDTOList.add(sysUserDTO);
            });
        }
        return sysUserDTOList;
    }

    @Override
    public TokenDTO login(String username, String password) {
        SysUser sysUser = query().eq(SysUser.USERNAME, username).one();//根据用户名查找
        //用户不存在
        AssertUtil.notNull(ErrorCodeEnum.USERNAME_OR_PASSWORD_IS_WRONG, sysUser);
        //用户被冻结
        AssertUtil.isTrue(ErrorCodeEnum.USER_IS_DISABLED, Constants.USER_STATUS.NORMAL == sysUser.getStatus());
        //验证登录密码
        validatePassword(sysUser,password);
        //组装登录用户信息
        LoginUser loginUser = new LoginUser();
        BeanUtils.copyProperties(sysUser, loginUser);//基本信息复制
        //查找用户所属的角色列表
        List<SysRole> userRoleList = sysRoleService.getUserRoleList(sysUser.getId());
        List<LoginUser.Role> roleList = new ArrayList<>();
        userRoleList.forEach(sysRole -> {
            LoginUser.Role role = new LoginUser.Role();
            BeanUtils.copyProperties(sysRole, role);
            role.setRoleId(sysRole.getId());
            roleList.add(role);
        });
        loginUser.setRoleList(roleList);
        //查找该用户所拥有的权限
        List<String> userPerms = sysResourceService.getUserPerms(sysUser.getId());
        setUserAgent(loginUser);
        JwtConfig jwtConfig = jwtTokenFactory.getJwtConfig();
        TokenDTO tokenDTO;
        if(jwtConfig.isEnabled()){
            //缓存用户权限列表
            bizCacheService.saveUserPerm(loginUser.getId(),userPerms);
            //生成登录JwtToken，JwtToken中保存了登录用户信息，解析JwtToken即可得到，不需要保存到缓存
            JwtToken accessToken = jwtTokenFactory.createJwtToken(loginUser);
            JwtToken refreshToken = jwtTokenFactory.createRefreshToken(loginUser);
            tokenDTO = new TokenDTO(accessToken.getToken(),refreshToken.getToken(),Constants.TOKEN_TYPE.JWT,jwtTokenFactory.getJwtConfig().getAuthorization());
        }else {
            //生成一个登录token
            String token = GUIDUtil.genRandomGUID();
            tokenDTO = new TokenDTO(token,"",Constants.TOKEN_TYPE.SESSION,Constants.LOGIN_USER.AUTHORIZATION);
            loginUser.setPermsList(userPerms);
            bizCacheService.saveLoginUser(token,loginUser);//保存登录用户信息
        }
        LoginUserContext.set(loginUser);//LogAspect需要记录登录用户日志信息
        return tokenDTO;
    }

    /**
     * 验证登录密码
     * @param sysUser
     * @param password
     */
    private void validatePassword(SysUser sysUser,String password){
        SecuritySetting securitySetting = sysConfigService.getSecuritySetting();
        //用户密码错误
        if(!SecureUtil.sha256(password + sysUser.getSalt()).equals(sysUser.getPassword())){
            //记录错误次数
            int failedLoginAttempts = increaseFailedLoginAttempts(sysUser);
            if (securitySetting.getMaxFailedLoginAttempts() != null && securitySetting.getMaxFailedLoginAttempts() > 0) {
                //用户登录错误重试次数超过允许重试的次数后锁定用户(禁用用户)
                if (failedLoginAttempts > securitySetting.getMaxFailedLoginAttempts()) {
                    if(Constants.USER_STATUS.NORMAL == sysUser.getStatus()){
                        ThreadUtil.execute(() -> {
                            //禁用用户
                            sysUser.setStatus(Constants.USER_STATUS.FROZEN);
                            updateById(sysUser);
                            if(StrUtil.isNotEmpty(securitySetting.getUserLockoutNotificationEmail())){
                                //todo 发送邮件通知系统管理员
                            }
                        });
                    }
                    throw new Magic4jException("由于您登录错误次数超过"+securitySetting.getMaxFailedLoginAttempts()+"次，您的登录帐号已经被冻结");
                }
            }
            throw new Magic4jException("用户名或密码错误，请注意：登录错误次数如果超过"+securitySetting.getMaxFailedLoginAttempts()+"次，登录帐号将暂时被冻结");
        }

        //密码正确的前提下再判断密码是否过期
        if (isPositiveInteger(securitySetting.getPasswordPolicy().getPasswordExpirationPeriodDays())) {
            if ((sysUser.getUpdateTime().toInstant(ZoneOffset.of("+8")).toEpochMilli()
                    + TimeUnit.DAYS.toMillis(securitySetting.getPasswordPolicy().getPasswordExpirationPeriodDays()))
                    < System.currentTimeMillis()) {
                throw new Magic4jException("您的密码已经过期，需要重新修改新的密码后才能登录");
            }
        }
        ThreadUtil.execute(() -> {
            //登录成功，重置登录失败尝试次数
            resetFailedLoginAttempts(sysUser);
            //记录最后一次登录的时间
            setLastLoginTs(sysUser);
            updateById(sysUser);
        });
    }

    /**
     * 重置登录失败尝试次数
     * @param user
     */
    private void resetFailedLoginAttempts(SysUser user) {
        String additionalInfo = user.getAdditionalInfo();
        JSONObject additionalInfoJson;
        if(StrUtil.isNotEmpty(additionalInfo)){
            additionalInfoJson = JSON.parseObject(additionalInfo);
        }else {
            additionalInfoJson = new JSONObject();
        }
        additionalInfoJson.put(FAILED_LOGIN_ATTEMPTS, 0);
        user.setAdditionalInfo(additionalInfoJson.toJSONString());
    }

    /**
     *
     * 记录最后一次登录的时间
     * @param user
     */
    private void setLastLoginTs(SysUser user) {
        String additionalInfo = user.getAdditionalInfo();
        JSONObject additionalInfoJson;
        if(StrUtil.isNotEmpty(additionalInfo)){
            additionalInfoJson = JSON.parseObject(additionalInfo);
        }else {
            additionalInfoJson = new JSONObject();
        }
        additionalInfoJson.put(LAST_LOGIN_TS, System.currentTimeMillis());
        user.setAdditionalInfo(additionalInfoJson.toJSONString());
    }

    /**
     * 登录失败尝试次数加1
     * @param user
     * @return
     */
    private int increaseFailedLoginAttempts(SysUser user) {
        String additionalInfo = user.getAdditionalInfo();
        JSONObject additionalInfoJson;
        if(StrUtil.isNotEmpty(additionalInfo)){
            additionalInfoJson = JSON.parseObject(additionalInfo);
        }else {
            additionalInfoJson = new JSONObject();
        }
        int failedLoginAttempts = 0;
        if (additionalInfoJson.containsKey(FAILED_LOGIN_ATTEMPTS)) {
            failedLoginAttempts = additionalInfoJson.getInteger(FAILED_LOGIN_ATTEMPTS);
        }
        failedLoginAttempts = failedLoginAttempts + 1;
        additionalInfoJson.put(FAILED_LOGIN_ATTEMPTS, failedLoginAttempts);
        user.setAdditionalInfo(additionalInfoJson.toJSONString());//登录失败尝试次数次数加1
        updateById(user);
        return failedLoginAttempts;
    }

    @Override
    public void logout(String token) {
        bizCacheService.clearLoginUser(token);
    }

    @Transactional
    @Override
    public void initSuperAdminUser() {
        //创建超级系统用户
        String userName = "magic4j";
        //根据用户名查询
        SysUser sysUser = query().eq(SysUser.USERNAME, userName).one();
        if(sysUser == null){
            sysUser = new SysUser();
            sysUser.setUsername(userName);
            sysUser.setPassword("123456");
            sysUser.setRealName("孤傲苍狼");
            sysUser.setStatus(Constants.USER_STATUS.NORMAL);
            sysUser.setTenantId(Constants.SUPER_TENANT_ID);
            //生成20位长度的随机数，用作密码加密的盐
            String salt = RandomStringUtils.randomAlphanumeric(20);
            //将密码和盐使用sha256加密
            sysUser.setPassword(SecureUtil.sha256(sysUser.getPassword() + salt));
            sysUser.setSalt(salt);
            save(sysUser);//保存用户
        }
        Long userId = sysUser.getId();//保存初始化超级管理员用户
        //创建超级管理员角色
        String roleName = "magic管理员";
        SysRole sysRole = sysRoleService.query().eq(SysRole.ROLE_NAME, roleName).or().eq(SysRole.ROLE_CODE, Constants.SUPER_ADMIN_FLAG).one();
        if(sysRole == null){
            sysRole = new SysRole();
            sysRole.setRoleName(roleName);
            sysRole.setRoleCode(Constants.SUPER_ADMIN_FLAG);//超级管理员角色标识
            sysRole.setTenantId(Constants.SUPER_TENANT_ID);
            sysRole.setRemark("系统的超级管理员，拥有最高权限");
            sysRoleService.save(sysRole);
        }
        Long roleId = sysRole.getId();
        try {
            //为超级系统用户授权超级管理员角色
            sysUserRoleService.create(new SysUserRoleDTO(userId,roleId));
        }catch (Exception e){
            log.warn(e.getMessage());
        }
    }

    @Override
    public TokenDTO refreshAuthToken(String refreshToken) {
        LoginUser loginUser = jwtTokenFactory.parseRefreshToken(refreshToken);
        SysUser sysUser = getById(loginUser.getId());//根据用户ID查询登录用户
        BeanUtils.copyProperties(sysUser, loginUser);//基本信息复制
        //查找用户所属的角色列表
        List<SysRole> userRoleList = sysRoleService.getUserRoleList(sysUser.getId());
        List<LoginUser.Role> roleList = new ArrayList<>();
        userRoleList.forEach(sysRole -> {
            LoginUser.Role role = new LoginUser.Role();
            BeanUtils.copyProperties(sysRole, role);
            role.setRoleId(sysRole.getId());
            roleList.add(role);
        });
        loginUser.setRoleList(roleList);
        setUserAgent(loginUser);
        //查找该用户所拥有的权限
        List<String> userPerms = sysResourceService.getUserPerms(sysUser.getId());
        //缓存用户权限列表
        bizCacheService.saveUserPerm(loginUser.getId(),userPerms);
        //生成新的JwtToken，JwtToken中保存了登录用户信息，解析JwtToken即可得到，不需要保存到缓存
        JwtToken newAccessToken = jwtTokenFactory.createJwtToken(loginUser);
        JwtToken newRefreshToken = jwtTokenFactory.createRefreshToken(loginUser);
        return new TokenDTO(newAccessToken.getToken(),"BearerToken",jwtTokenFactory.getJwtConfig().getAuthorization(),newRefreshToken.getToken());
    }

    /**
     * 修改用户密码
     * @param id
     * @param oldPassword
     * @param newPassword
     */
    @Override
    public void updatePwd(Long id, String oldPassword, String newPassword) {
        SysUser sysUser = getById(id);//根据用户ID查询登录用户
        //原始密码错误
        AssertUtil.isTrue(ErrorCodeEnum.ORIGINAL_PASSWORD_IS_INCORRECT, SecureUtil.sha256(oldPassword + sysUser.getSalt()).equals(sysUser.getPassword()));
        validatePasswordRule(id,newPassword);
        //修改密码的同时，把用于密码加密的盐也一起修改
        //生成20位长度的随机数，用作密码加密的盐
        String salt = RandomStringUtils.randomAlphanumeric(20);
        //将密码使用sha256加密
        sysUser.setPassword(SecureUtil.sha256(newPassword + salt));
        sysUser.setSalt(salt);
        updateById(sysUser);
    }

    /**
     * 重置密码
     * @param id
     * @param password
     */
    @Override
    public void resetPwd(Long id, String password) {
        validatePasswordRule(id,password);//验证密码规则
        SysUser sysUser = new SysUser();
        sysUser.setId(id);
        //生成20位长度的随机数，用作密码加密的盐
        String salt = RandomStringUtils.randomAlphanumeric(20);
        //将密码使用sha256加密
        sysUser.setPassword(SecureUtil.sha256(password + salt));
        sysUser.setSalt(salt);
        updateById(sysUser);
    }

    /**
     * 验证密码规则
     *
     * @param password
     */
    @Override
    public void validatePasswordRule(Long userId,String password) {
        SecuritySetting securitySetting = sysConfigService.getSecuritySetting();
        UserPasswordPolicy passwordPolicy = securitySetting.getPasswordPolicy();
        List<Rule> passwordRules = new ArrayList<>();
        //密码组成规则校验
        passwordRules.add(new LengthRule(passwordPolicy.getMinimumLength(), passwordPolicy.getMaximumLength()));//密码长度范围
        if (isPositiveInteger(passwordPolicy.getMinimumUppercaseLetters())) {
            passwordRules.add(new CharacterRule(EnglishCharacterData.UpperCase, passwordPolicy.getMinimumUppercaseLetters()));//包含的大写字母个数
        }
        if (isPositiveInteger(passwordPolicy.getMinimumLowercaseLetters())) {
            passwordRules.add(new CharacterRule(EnglishCharacterData.LowerCase, passwordPolicy.getMinimumLowercaseLetters()));//包含的小写字母个数
        }
        if (isPositiveInteger(passwordPolicy.getMinimumDigits())) {
            passwordRules.add(new CharacterRule(EnglishCharacterData.Digit, passwordPolicy.getMinimumDigits()));//包含的数字个数
        }
        if (isPositiveInteger(passwordPolicy.getMinimumSpecialCharacters())) {
            passwordRules.add(new CharacterRule(EnglishCharacterData.Special, passwordPolicy.getMinimumSpecialCharacters()));//包含的特殊字符个数
        }
        PasswordValidator validator = new PasswordValidator(passwordRules);
        PasswordData passwordData = new PasswordData(password);
        RuleResult result = validator.validate(passwordData);//校验密码组成规则
        if (!result.isValid()) {
            String message = passwordPolicy.getPasswordPolicyDesc();
            throw new DataValidationException(message);
        }
    }

    @Override
    public void enableUser(List<Long> idList) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(SysUser.ID,idList);
        List<SysUser> sysUsers = list(queryWrapper);
        sysUsers.forEach(sysUser -> {
            sysUser.setStatus(Constants.USER_STATUS.NORMAL);
            resetFailedLoginAttempts(sysUser);
        });
        updateBatchById(sysUsers);
    }

    @Override
    public List<SysUser> getTenantUserList(QueryWrapper<SysUser> queryWrapper) {
        return sysUserMapper.getTenantUserList(queryWrapper);
    }

    @Override
    public IPage<SysUser> pageList(IPage<SysUser> page, QueryWrapper<SysUser> queryWrapper) {
        return page.setRecords(sysUserMapper.page(page,queryWrapper));
    }

    /**
     * 导入用户
     * @param data
     * @param isCovered
     */
    @Override
    public void importUser(List<UserExcel> data, Boolean isCovered) {
        data.forEach(userExcel -> {
            SysUserDTO sysUserDTO = new SysUserDTO();
            BeanUtils.copyProperties(userExcel,sysUserDTO);
            List<Long> deptIds = SysCache.getDeptIds(userExcel.getDeptName());
            if(CollectionUtil.isNotEmpty(deptIds)){
                sysUserDTO.setDeptId(deptIds.get(0));
            }
            List<Long> roleIds = SysCache.getRoleIds(userExcel.getRoleName());
            if(CollectionUtil.isNotEmpty(roleIds)){
                Long[] roleIdArr = new Long[roleIds.size()];
                sysUserDTO.setRoleIds(roleIds.toArray(roleIdArr));
            }
            List<Long> postIds = SysCache.getPostIds(userExcel.getPostName());
            if(CollectionUtil.isNotEmpty(postIds)){
                Long[] postIdArr = new Long[postIds.size()];
                sysUserDTO.setPostIds(postIds.toArray(postIdArr));
            }
            // 覆盖数据
            if (isCovered) {
                // 查询用户是否存在
                SysUser oldUser = SysCache.getUser(userExcel.getUsername());
                if (oldUser != null && oldUser.getId() != null) {
                    sysUserDTO.setId(oldUser.getId());
                    update(sysUserDTO);
                }
            }else {
                create(sysUserDTO);
            }
        });
    }

    private boolean isPositiveInteger(Integer val) {
        return val != null && val > 0;
    }

    /**
     * 设置用户代理信息
     *
     * @param loginUser 登录信息
     */
    private void setUserAgent(LoginUser loginUser) {
        UserAgent userAgent = UserAgent.parseUserAgentString(SpringContextUtils.getRequest().getHeader("User-Agent"));
        String ip = IpUtils.getIpAddr(SpringContextUtils.getRequest());
        loginUser.setIpAddress(ip);
        AddressInfo addressInfo = commApiService.getAddressByIP(ip);
        loginUser.setLoginLocation(addressInfo.getAddress());
        loginUser.setLat(addressInfo.getLat());
        loginUser.setLng(addressInfo.getLng());
        loginUser.setBrowser(userAgent.getBrowser().getName());
        loginUser.setOs(userAgent.getOperatingSystem().getName());
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysUserDTO> dataValidator = new DataValidator<SysUserDTO>(){

        @Override
        protected void validateData(SysUserDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        @Override
        protected void beforeCreate(SysUserDTO data) {
            //判断用户名是否已经存在
            SysUser sysUser = query().eq(SysUser.USERNAME, data.getUsername()).one();
            AssertUtil.isTrue(ErrorCodeEnum.USERNAME_ALREADY_EXISTS,sysUser == null);//断言用户名已存在
            //根据邮箱查询
            sysUser = query().eq(SysUser.EMAIL, data.getEmail()).one();
            AssertUtil.isTrue(ErrorCodeEnum.EMAIL_ALREADY_EXISTS,sysUser == null);//断言邮箱已存在
            //根据手机号查询
            sysUser = query().eq(SysUser.CELLPHONE, data.getCellphone()).one();
            AssertUtil.isTrue(ErrorCodeEnum.CELLPHONE_ALREADY_EXISTS,sysUser == null);//断言手机号已存在
        }

        @Override
        protected void beforeUpdate(SysUserDTO data) {
            //根据用户名查询
            SysUser sysUser = query().eq(SysUser.USERNAME, data.getUsername()).one();
            if(sysUser != null){
                AssertUtil.equals(ErrorCodeEnum.USERNAME_ALREADY_EXISTS,data.getId(),sysUser.getId());
            }

            //根据邮箱查询
            sysUser = query().eq(SysUser.EMAIL, data.getEmail()).one();
            if(sysUser != null){
                AssertUtil.equals(ErrorCodeEnum.EMAIL_ALREADY_EXISTS,data.getId(),sysUser.getId());
            }

            //根据手机号查询
            sysUser = query().eq(SysUser.CELLPHONE, data.getCellphone()).one();
            if(sysUser != null){
                AssertUtil.equals(ErrorCodeEnum.CELLPHONE_ALREADY_EXISTS,data.getId(),sysUser.getId());
            }
        }
    };
}
