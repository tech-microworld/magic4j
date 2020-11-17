package com.itgacl.magic4j.modules.api.controller;

import com.itgacl.magic4j.common.base.AppBaseController;

import com.itgacl.magic4j.modules.demo.service.DeviceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import java.util.*;


/**
 * @Classname DeviceController
 * @Description 设备信息 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-04
 * @Version 1.0
 */
@Api(tags = "设备管理")
@RestController
@RequestMapping("/app/api/demo/device")
public class DeviceApiController extends AppBaseController{

    @Autowired
    private DeviceService deviceService;
}