package com.itgacl.magic4j.modules.tool;

import cn.hutool.core.lang.UUID;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.modules.sys.dto.SysResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.service.SysResourceService;
import com.itgacl.magic4j.modules.sys.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/tool")
public class ToolController extends SuperController {

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private SysRoleService sysRoleService;

    @Value("${magic4j.idempotent.authorization}")
    private String authorization; //幂等性Token请求头

    /**
     * 为超级管理员授权
     * @return
     */
    @PostMapping("/authorize")
    public R authorizeSuperAdmin(){
        List<SysResourceDTO> resourceDTOList = sysResourceService.getList(null);
        List<Long> resIds = new ArrayList<>();
        resourceDTOList.forEach(item-> resIds.add(item.getId()));
        SysRole sysRole = sysRoleService.query().eq(SysRole.ROLE_CODE, Constants.SUPER_ADMIN_FLAG).one();
        sysRoleService.bindResource(sysRole.getId(),resIds);
        return R.ok();
    }

    /**
     * 获取AES加密密钥
     * @return
     */
    @GetMapping("/aes/secretKey")
    public R getAesSecretKey(){
        return R.ok(Maps.builder().put("aesSecretKey",bizCacheService.getAesSecretKey()).build());
    }

    /**
     * 获取RSA加密公钥
     * @return
     */
    @GetMapping("/rsa/publicKey")
    public R getRsaPublicKey(){
        return R.ok(Maps.builder().put("publicKey",bizCacheService.getRsaPublicKey()).build());
    }

    @GetMapping("/secret/key")
    public R getSecretKey(){
        String aesSecretKey = bizCacheService.getAesSecretKey();
        String rsaPublicKey = bizCacheService.getRsaPublicKey();
        return R.ok(Maps.builder().put("aesSecretKey",aesSecretKey).put("rsaPublicKey",rsaPublicKey).build());
    }

    /**
     *
     * 获取幂等性校验Token
     * @return
     */
    @GetMapping("/idempotent/token")
    public R getIdempotentToken(){
        String token = UUID.fastUUID().toString();
        cacheService.set(token,token);//缓存幂等性校验Token
        return R.ok(Maps.builder().put("token",token).put("authorization",authorization).build());
    }
}
