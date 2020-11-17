package com.itgacl.magic4j.modules.demo.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.modules.demo.service.DeviceService;
import com.itgacl.magic4j.modules.demo.entity.Device;
import com.itgacl.magic4j.modules.demo.vo.DeviceVo;
import com.itgacl.magic4j.modules.demo.dto.DeviceDTO;
import com.itgacl.magic4j.modules.demo.query.DeviceQuery;
import com.itgacl.magic4j.modules.demo.excel.DeviceImporter;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
/**
 * @Classname DeviceController
 * @Description 设备信息 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@Api(tags = "Device管理")
//@Auth(name = "Device管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/demo/device")
public class DeviceController extends SuperController{

    @Autowired
    private DeviceService deviceService;

    /**
     * 创建
     * @param device
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建Device",moduleName = "Device管理") //在方法上标注@Log注解用于记录操作日志
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) DeviceDTO device){
        deviceService.create(device);
        return R.ok();
    }

    /**
     * 更新
     * @param device
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改Device",moduleName = "Device管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) DeviceDTO device){
        deviceService.update(device);
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
    public R<DeviceVo> get(@PathVariable("id") Long id){
        DeviceVo deviceVo = deviceService.getDeviceById(id);
        return R.ok(deviceVo);
    }

    /**
     * 根据条件查询
     * @return
     */
    @ApiOperation("根据条件查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<DeviceVo>> get(DeviceQuery query) {
        //构建查询条件
        QueryWrapper<Device> queryWrapper = buildQueryWrapper(query);
        List<DeviceVo> deviceListVo = deviceService.getList(queryWrapper);
        return R.ok(deviceListVo);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除Device",moduleName = "Device管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            deviceService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            deviceService.deleteByIds(idList);
        }
        return R.ok();
    }

    @ApiOperation("导入数据")
    @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖")
    @PostMapping("/importData")
    public R<Void> importData(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered) {
        DeviceImporter deviceImporter = new DeviceImporter(deviceService, isCovered);
        ExcelUtil.save(file, deviceImporter, DeviceDTO.class);
        return R.success("导入成功");
    }

    @ApiOperation("导出数据到Excel")
    @GetMapping("/exportData")
    public void exportData(DeviceQuery query, HttpServletResponse response) {
        //构建查询条件
        QueryWrapper<Device> queryWrapper = buildQueryWrapper(query);
        List<DeviceVo> deviceVoList = deviceService.getList(queryWrapper);
        if(CollectionUtil.isNotEmpty(deviceVoList)){
            if(ArrayUtil.isNotEmpty(query.getExportColumnNames())){
                //导出Excel，指定需要导出的列
                ExcelUtil.export(response, "Device" + DateUtils.getCurrentTime(), "Device数据表", deviceVoList, DeviceVo.class,Arrays.asList(query.getExportColumnNames()));
            }else {
                //导出Excel，导出全部列
                ExcelUtil.export(response, "Device" + DateUtils.getCurrentTime(), "Device数据表", deviceVoList, DeviceVo.class);
            }
        }
    }

    @ApiOperation("导出数据到Excel并上传到文件服务器")
    @PostMapping("/exportData")
    public R<UploadResult> exportData(@RequestBody DeviceQuery query) {
        //构建查询条件
        QueryWrapper<Device> queryWrapper = buildQueryWrapper(query);
        List<DeviceVo> deviceVoList = deviceService.getList(queryWrapper);
        UploadResult uploadResult;
        if(ArrayUtil.isNotEmpty(query.getExportColumnNames())){
            //导出Excel并上传到文件服务器，指定需要导出的列
            uploadResult = ExcelUtil.exportAndUpload("Device" + DateUtils.getCurrentTime(), "Device数据表", deviceVoList, DeviceVo.class,Arrays.asList(query.getExportColumnNames()));
        }else {
            //导出Excel并上传到文件服务器，导出全部列
            uploadResult = ExcelUtil.exportAndUpload("Device" + DateUtils.getCurrentTime(), "Device数据表", deviceVoList, DeviceVo.class);
        }
        return R.ok(uploadResult);
    }

    @ApiOperation("获取数据导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<DeviceDTO> list = new ArrayList<>();
        ExcelUtil.export(response, "Device数据导入模板", "Device数据表", list, DeviceDTO.class);
    }
    /**
      * 分页查询
      * @return
      */
    @ApiOperation("分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<DeviceVo>> pageList(DeviceQuery query, PageParam pageParam){
        //构建查询条件
        QueryWrapper<Device> queryWrapper = buildQueryWrapper(query);
        PageData<DeviceVo> pageData = deviceService.pageList(pageParam,queryWrapper);//mybatisPlus分页查询
        return R.ok(pageData);
    }

    /**
     * 根据当前位置查找设备信息
     * @param location 位置
     */
    @Auth(isAuth = false)
    @GetMapping("/location/list")
    public R<List<DeviceVo>> getDeviceListByLocation(String location){
        QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotBlank(location)){
            queryWrapper.eq(Device.COUNTRY,location)
                    .or().eq(Device.PROVINCE,location)
                    .or().eq(Device.CITY,location)
                    .or().eq(Device.DISTRICT,location);
        }
        return R.ok(deviceService.getList(queryWrapper));
    }

    /**
     * 构建查询条件QueryWrapper
     * @param query
     * @return
     */
    private QueryWrapper<Device> buildQueryWrapper(DeviceQuery query) {
        QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
        //构建查询条件
        if(query.getId() != null){
            queryWrapper.eq(Device.ID,query.getId());
        }
        if(StrUtil.isNotBlank(query.getDeviceCode())){
            queryWrapper.like(Device.DEVICE_CODE,query.getDeviceCode());
        }
        if(StrUtil.isNotBlank(query.getDeviceName())){
            queryWrapper.like(Device.DEVICE_NAME,query.getDeviceName());
        }
        if(StrUtil.isNotBlank(query.getDeviceArea())){
            queryWrapper.like(Device.DEVICE_AREA,query.getDeviceArea());
        }
        if(StrUtil.isNotBlank(query.getDevicePtName())){
            queryWrapper.like(Device.DEVICE_PT_NAME,query.getDevicePtName());
        }
        if(StrUtil.isNotBlank(query.getLongitude())){
            queryWrapper.like(Device.LONGITUDE,query.getLongitude());
        }
        if(StrUtil.isNotBlank(query.getLatitude())){
            queryWrapper.like(Device.LATITUDE,query.getLatitude());
        }
        if(StrUtil.isNotBlank(query.getGePoName())){
            queryWrapper.like(Device.GE_PO_NAME,query.getGePoName());
        }
        if(StrUtil.isNotBlank(query.getState())){
            queryWrapper.like(Device.STATE,query.getState());
        }
        if(StrUtil.isNotBlank(query.getMaName())){
            queryWrapper.like(Device.MA_NAME,query.getMaName());
        }
        if(StrUtil.isNotBlank(query.getMaPhone())){
            queryWrapper.like(Device.MA_PHONE,query.getMaPhone());
        }
        if(StrUtil.isNotBlank(query.getCountry())){
            queryWrapper.like(Device.COUNTRY,query.getCountry());
        }
        if(StrUtil.isNotBlank(query.getProvince())){
            queryWrapper.like(Device.PROVINCE,query.getProvince());
        }
        if(StrUtil.isNotBlank(query.getCity())){
            queryWrapper.like(Device.CITY,query.getCity());
        }
        if(StrUtil.isNotBlank(query.getDistrict())){
            queryWrapper.like(Device.DISTRICT,query.getDistrict());
        }
        if(ArrayUtil.isNotEmpty(query.getIds())){
            queryWrapper.in(Device.ID,Arrays.asList(query.getIds()));
        }
        return queryWrapper;
    }
}