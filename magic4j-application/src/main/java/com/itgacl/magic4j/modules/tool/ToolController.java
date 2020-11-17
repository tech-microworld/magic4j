package com.itgacl.magic4j.modules.tool;

import cn.hutool.core.lang.UUID;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.api.bean.AddressInfo;
import com.itgacl.magic4j.libcommon.component.api.service.CommApiService;
import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.service.SysLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@Api(tags = "系统工具")
@RestController
@RequestMapping("/api/tool")
public class ToolController extends SuperController {

    @Value("${magic4j.idempotent.authorization}")
    private String authorization; //幂等性Token请求头

    @Autowired
    private SysLogService sysLogService;

    @Autowired
    private CommApiService commApiService;

    /**
     * 获取AES加密密钥
     * @return
     */
    @ApiOperation("获取AES加密密钥，返回的data是一个Map，key为aesSecretKey")
    @GetMapping("/aes/secretKey")
    public R<Map<Object,Object>> getAesSecretKey(){
        return R.ok(Maps.builder().put("aesSecretKey",bizCacheService.getAesSecretKey()).build());
    }

    /**
     * 获取RSA加密公钥
     * @return
     */
    @ApiOperation("获取RSA加密公钥，返回的data是一个Map，key为rsaPublicKey")
    @GetMapping("/rsa/publicKey")
    public R<Map<Object,Object>> getRsaPublicKey(){
        return R.ok(Maps.builder().put("publicKey",bizCacheService.getRsaPublicKey()).build());
    }

    @ApiOperation("获取RSA公钥和AES加密密钥，返回的data是一个Map，key分别为aesSecretKey和rsaPublicKey，对应的值为AES密钥和rsa公钥")
    @GetMapping("/secret/key")
    public R<Map<Object,Object>> getSecretKey(){
        String aesSecretKey = bizCacheService.getAesSecretKey();
        String rsaPublicKey = bizCacheService.getRsaPublicKey();
        return R.ok(Maps.builder().put("aesSecretKey",aesSecretKey).put("rsaPublicKey",rsaPublicKey).build());
    }

    /**
     *
     * 获取幂等性校验Token
     * @return
     */
    @ApiOperation("获取幂等性校验Token，返回的data是一个Map，key分别为token和authorization，对应的值为幂等校验Token和传递幂等token使用的请求头")
    @GetMapping("/idempotent/token")
    public R<Map<Object,Object>> getIdempotentToken(){
        String token = UUID.fastUUID().toString();
        cacheService.set(token,token);//缓存幂等性校验Token
        return R.ok(Maps.builder().put("token",token).put("authorization",authorization).build());
    }

    /**
     * 修正客户端的坐标位置
     * @return
     */
    @ApiOperation("修正客户端的坐标位置")
    @ApiImplicitParam(name = "ip",value = "IP地址")
    @PutMapping("/updateClientLocation")
    public R<Void> updateClientLocation(String ip){
        List<SysLog> logList;
        if(StringUtils.isNotBlank(ip)){
            logList = sysLogService.query().eq(SysLog.CLIENT_IP,ip).list();
        }else {
            logList = sysLogService.query().list();
        }
        logList.forEach(sysLog -> {
            if(StringUtils.isNotBlank(sysLog.getClientIp())){
                AddressInfo address = commApiService.getAddressByIP(sysLog.getClientIp());
                if(address.getLat()!=null && address.getLng() != null){
                    sysLog.setLng(address.getLng());
                    sysLog.setLat(address.getLat());
                }
            }
        });
        sysLogService.updateBatchById(logList);
        return R.ok();
    }
}
