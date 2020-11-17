package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysUserDTO;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import com.itgacl.magic4j.modules.sys.entity.SysUser;
import com.itgacl.magic4j.modules.sys.excel.UserExcel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统用户 服务类
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-18
 */
public interface SysUserService extends IService<SysUser> {

    Long create(SysUserDTO sysUserDTO);

    void update(SysUserDTO sysUserDTO);

    void deleteById(Long id);

    void deleteAll();

    void deleteByIds(List<Long> idList);

    SysUserDTO getSysUserById(Long id);

    List<SysUserDTO> getList(QueryWrapper<SysUser> queryWrapper);

    TokenDTO login(String username, String password);

    void logout(String token);

    void initSuperAdminUser();

    TokenDTO refreshAuthToken(String refreshToken);

    void updatePwd(Long id, String oldPassword, String newPassword);

    void resetPwd(Long id,String password);

    /**
     * 验证密码规则
     * @param password
     */
    void validatePasswordRule(Long userId,String password);

    void enableUser(List<Long> idList);

    /**
     * 获取租户用户
     * @param queryWrapper
     * @return
     */
    List<SysUser> getTenantUserList(QueryWrapper<SysUser> queryWrapper);

    IPage<SysUser> pageList(IPage<SysUser> page, QueryWrapper<SysUser> queryWrapper);

    /**
     * 导入用户
     * @param data
     * @param isCovered
     */
    void importUser(List<UserExcel> data, Boolean isCovered);
}
