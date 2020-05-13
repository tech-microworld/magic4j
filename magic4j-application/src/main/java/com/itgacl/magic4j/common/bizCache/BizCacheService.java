package com.itgacl.magic4j.common.bizCache;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSONObject;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.modules.sys.dto.SysDeptDTO;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.modules.sys.dto.SysRoleDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.itgacl.magic4j.modules.sys.entity.SysPost;
import com.itgacl.magic4j.modules.sys.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务缓存服务
 */
@Slf4j
@Service
public class BizCacheService {

    @Autowired
    private CacheService cacheService;

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private SysDeptService sysDeptService;

    @Autowired
    private SysPostService sysPostService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 保存登录用户信息
     * @param token
     * @param loginUser
     */
    public void saveLoginUser(String token,LoginUser loginUser) {
        //将登录用户信息放到缓存(以token为key)
        cacheService.set(Constants.LOGIN_USER.TOKEN_PREFIX + token, loginUser);
        //将登录token放到缓存(以用户名为key)
        cacheService.set(Constants.LOGIN_USER.USERNAME_PREFIX + loginUser.getUsername(), token);
        //将登录token放到缓存(以用户id为key)
        cacheService.set(Constants.LOGIN_USER.UID_PREFIX + loginUser.getId(), token);
    }

    /***
     * 根据Token获取登录用户信息
     * @param token
     * @return
     */
    public LoginUser getLoginUser(String token) {
        //从缓存中获取当前登录的系统用户
        return cacheService.get(Constants.LOGIN_USER.TOKEN_PREFIX + token);
    }

    /**
     * 清除登录用户信息
     * @param token
     */
    public void clearLoginUser(String token) {
        LoginUser loginUser = cacheService.get(Constants.LOGIN_USER.TOKEN_PREFIX + token);
        if (loginUser != null) {
            cacheService.remove(Constants.LOGIN_USER.USERNAME_PREFIX + loginUser.getUsername());//移除缓存中的token
            cacheService.remove(Constants.LOGIN_USER.UID_PREFIX + loginUser.getId());//移除缓存中的token
        }
        //注销，删除缓存中的用户信息
        cacheService.remove(Constants.LOGIN_USER.TOKEN_PREFIX + token);
    }

    /**
     * 缓存用户权限列表
     * @param id
     * @param userPerms
     */
    public void saveUserPerm(Long id,List<String> userPerms) {
        cacheService.set(Constants.LOGIN_USER.PERMS_PREFIX + id, userPerms);
    }

    /**
     * 获取用户权限列表，如果缓存没有，则从DB查询
     * @param id
     * @return
     */
    public List<String> getUserPerm(Long id){
       return cacheService.get(Constants.LOGIN_USER.PERMS_PREFIX + id, () -> {
           return sysResourceService.getUserPerms(id);//查找该用户所拥有的权限
       });
    }

    public SysDeptDTO getDept(Long deptId){
        SysDeptDTO sysDeptDTO = new SysDeptDTO();
        return cacheService.get(BizCacheConstants.SYS.DEPT_ID + deptId, () -> {
            if(ObjectUtil.isNotEmpty(deptId)){
                SysDept sysDept = sysDeptService.getById(deptId);
                if(ObjectUtil.isNotEmpty(sysDept)){
                    BeanUtils.copyProperties(sysDeptService.getById(deptId),sysDeptDTO);
                }
            }
            return sysDeptDTO;
        });
    }

    public SysPostDTO getPost(Long postId){
        SysPostDTO sysPostDTO = new SysPostDTO();
        return cacheService.get(BizCacheConstants.SYS.POST_ID + postId, () -> {
            if(ObjectUtil.isNotEmpty(postId)){
                SysPost sysPost = sysPostService.getById(postId);
                if(ObjectUtil.isNotEmpty(sysPost)){
                    BeanUtils.copyProperties(sysPost,sysPostDTO);
                }
            }
            return sysPostDTO;
        });
    }

    public SysRoleDTO getRole(Long roleId){
        return cacheService.get(BizCacheConstants.SYS.ROLE_ID + roleId, () -> {
            SysRoleDTO sysRoleDTO = new SysRoleDTO();
            BeanUtils.copyProperties(sysRoleService.getById(roleId),sysRoleDTO);
            return sysRoleDTO;
        });
    }

    public void saveAesSecretKey(String aesSecretKey){
        cacheService.set(Constants.SECURITY.AES_SECRET_KEY,aesSecretKey);
    }

    public String getAesSecretKey(){
        return cacheService.get(Constants.SECURITY.AES_SECRET_KEY, () -> sysConfigService.query().select(SysConfig.CONFIG_VALUE).eq(SysConfig.CONFIG_KEY,"AesSecretKey").eq(SysConfig.STATUS, 0).one().getConfigValue());
    }

    public void cleanAesSecretKey(){
        cacheService.remove(Constants.SECURITY.AES_SECRET_KEY);
    }

    public void saveRsaSecretKey(String privateKeyBase64,String publicKeyBase64){
        //将RSA密钥存放到缓存中
        cacheService.set(Constants.SECURITY.RSA_PUBLIC_KEY,publicKeyBase64);
        cacheService.set(Constants.SECURITY.RSA_PRIVATE_KEY,privateKeyBase64);
    }

    public void cleanRsaSecretKey(){
        cacheService.remove(Constants.SECURITY.RSA_PUBLIC_KEY);
        cacheService.remove(Constants.SECURITY.RSA_PRIVATE_KEY);
    }

    public String getRsaPublicKey(){
        return cacheService.get(Constants.SECURITY.RSA_PUBLIC_KEY, () ->{
            /*String rsaKeyPair = sysConfigService
                    .query()
                    .select(SysConfig.CONFIG_VALUE)
                    .eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR).eq(SysConfig.STATUS, 0)
                    .one()
                    .getConfigValue();*/
            String rsaKeyPair = sysConfigService.getConfigByKey(Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR).getConfigValue();
            return JSONObject.parseObject(rsaKeyPair).getString(Constants.SYS_CONFIG_KEY.PUBLIC_KEY);
        });
    }

    public String getRsaPrivateKey() {
        return cacheService.get(Constants.SECURITY.RSA_PRIVATE_KEY, () -> {
           /* String rsaKeyPair = sysConfigService
                    .query()
                    .select(SysConfig.CONFIG_VALUE)
                    .eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR)
                    .eq(SysConfig.STATUS, 0)
                    .one()
                    .getConfigValue();*/
            String rsaKeyPair = sysConfigService.getConfigByKey(Constants.SYS_CONFIG_KEY.RSA_KEY_PAIR).getConfigValue();
            return JSONObject.parseObject(rsaKeyPair).getString(Constants.SYS_CONFIG_KEY.PRIVATE_KEY);
        });
    }

    public String getOperaType(String dictCode){
        return cacheService.get(BizCacheConstants.DICT_TYPE.OPER_TYPE+dictCode);
    }

    public void setOperaType(String dictCode,String dictLabel){
        cacheService.set(BizCacheConstants.DICT_TYPE.OPER_TYPE+dictCode,dictLabel);
    }

    public void setStorageType(String storageType){
        cacheService.set(Constants.STORAGE_TYPE,storageType);
    }

    public String getStorageType(){
      /* return cacheService.get(Constants.STORAGE_TYPE,()-> sysConfigService
               .query()
               .select(SysConfig.CONFIG_VALUE)
               .eq(SysConfig.CONFIG_KEY, Constants.SYS_CONFIG_KEY.FILE_STORAGE_TYPE)
               .eq(SysConfig.STATUS, 0)
               .one()
               .getConfigValue());*/

        return cacheService.get(Constants.STORAGE_TYPE,()-> sysConfigService.getConfigByKey(Constants.SYS_CONFIG_KEY.FILE_STORAGE_TYPE).getConfigValue());
    }
}
