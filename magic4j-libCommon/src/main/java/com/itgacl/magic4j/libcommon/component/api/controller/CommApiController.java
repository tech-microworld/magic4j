package com.itgacl.magic4j.libcommon.component.api.controller;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.component.api.bean.AddressInfo;
import com.itgacl.magic4j.libcommon.component.api.bean.LocationInfo;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.api.bean.RegionInfo;
import com.itgacl.magic4j.libcommon.component.api.service.CommApiService;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import com.itgacl.magic4j.libcommon.util.QrCodeUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 通用API
 */
@Api(tags = "公共接口")
@RequestMapping("/api/comm")
@RestController
public class CommApiController extends Magic4jBaseController {

    @Autowired
    private CommApiService commApiService;

    @ApiOperation(value = "根据文本内容生成二维码",notes = "生成成功后返回二维码图片的网络URL地址")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "qrCodeText",value = "二维码的文本内容",required = true),
            @ApiImplicitParam(name = "qrCodeWidth",value = "二维码图片的宽度"),
            @ApiImplicitParam(name = "qrCodeHeight",value = "二维码图片的高度")
    })
    @Validator(value = "qrCodeText",message = "二维码的文本内容不能为空")
    @GetMapping("/createQrCode")
    public R<String> createQrCode(String qrCodeText, Integer qrCodeWidth, Integer qrCodeHeight){
        String qrCodeImgUrl = "";
        if(qrCodeWidth!=null && qrCodeHeight!=null){
            qrCodeImgUrl = QrCodeUtil.createQrCode(qrCodeText, qrCodeWidth, qrCodeHeight);
        }else {
            qrCodeImgUrl = QrCodeUtil.createQrCode(qrCodeText);
        }
        if(StrUtil.isNotBlank(qrCodeImgUrl)){
            R<String> r = R.ok();
            r.setData(qrCodeImgUrl);
            return r;
        }else {
            return R.fail("二维码生成失败");
        }
    }

    @ApiOperation(value = "根据经纬度获取位置信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "longitude",value = "经度",required = true),
            @ApiImplicitParam(name = "latitude",value = "纬度",required = true)
    })
    @GetMapping("/get/location")
    public R<LocationInfo> getLocation(String longitude, String latitude){
        return R.ok(commApiService.getLocation(longitude,latitude));
    }

    @ApiOperation(value = "根据区域名称获取位置信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "query",value = "查询",required = true),
            @ApiImplicitParam(name = "region",value = "区域名称")
    })
    @GetMapping("/get/region")
    public R<RegionInfo> getRegionInfo(String query,String region){
        return R.ok(commApiService.getRegionInfo(query,region));
    }

    @ApiOperation(value = "根据Ip获取位置信息")
    @ApiImplicitParam(name = "ip",value = "IP地址",required = true)
    @GetMapping("/get/address")
    public R<AddressInfo> getLocation(String ip){
        return R.ok(commApiService.getAddressByIP(ip));
    }
}
