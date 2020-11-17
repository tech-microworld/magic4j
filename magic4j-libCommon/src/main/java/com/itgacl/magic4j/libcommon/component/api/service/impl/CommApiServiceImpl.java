package com.itgacl.magic4j.libcommon.component.api.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itgacl.magic4j.libcommon.component.api.bean.AddressInfo;
import com.itgacl.magic4j.libcommon.component.api.bean.LocationInfo;
import com.itgacl.magic4j.libcommon.component.api.bean.RegionInfo;
import com.itgacl.magic4j.libcommon.component.api.service.CommApiService;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.libcommon.util.ip.IpUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class CommApiServiceImpl implements CommApiService {

    @Value("${baidu.map.locationApiUrl}")
    private String bdMapLocationApiUrl;

    @Value("${baidu.map.regionSearchApiUrl}")
    private String bdMapRegionSearchApiUrl;

    @Value("${qq.map.locationApiUrl}")
    private String qqMapLocationApiUrl;

    @Override
    public LocationInfo getLocation(String longitude, String latitude) {
        String location = latitude+","+longitude;
        String ret = HttpUtil.get(bdMapLocationApiUrl + "&location=" + location);
        if(StrUtil.isNotBlank(ret)){
            LocationInfo locationInfo = new LocationInfo();
            JSONObject jsonObject = JSON.parseObject(ret);
            Integer status = jsonObject.getInteger("status");
            if(status!=0) {
                throw new Magic4jException("根据经纬度获取位置信息失败");
            }
            JSONObject jsonResult = jsonObject.getJSONObject("result");
            String address = jsonResult.getString("formatted_address");
            String cityCode = jsonResult.getString("cityCode");
            JSONObject addressComponent = jsonResult.getJSONObject("addressComponent");
            String country = addressComponent.getString("country");
            String province = addressComponent.getString("province");
            String city = addressComponent.getString("city");
            String district = addressComponent.getString("district");
            String street = addressComponent.getString("street");
            String adcode = addressComponent.getString("adcode");
            locationInfo.setAddress(address);
            locationInfo.setCityCode(cityCode);
            locationInfo.setCountry(country);
            locationInfo.setProvince(province);
            locationInfo.setCity(city);
            locationInfo.setDistrict(district);
            locationInfo.setStreet(street);
            locationInfo.setAdcode(adcode);
            return locationInfo;
        }else {
            throw new Magic4jException("根据经纬度获取城市信息失败");
        }
    }

    @Override
    public AddressInfo getAddressByIP(String ip) {
        AddressInfo addressQueryInfo = new AddressInfo();
        addressQueryInfo.setAddress("未知");
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            addressQueryInfo.setAddress("内网IP");
            return addressQueryInfo;
        }

        String rspStr = HttpUtil.get(qqMapLocationApiUrl+"&ip="+ip);
        if (StringUtils.isEmpty(rspStr)) {
            log.error("获取地理位置异常 {}", ip);
            return addressQueryInfo;
        }
        JSONObject jsonResData = JSONObject.parseObject(rspStr);
        if (jsonResData.getInteger("status") == 0) {
            JSONObject dataResult = jsonResData.getJSONObject("result");
            JSONObject location = dataResult.getJSONObject("location");
            addressQueryInfo.setLat(location.getBigDecimal("lat"));
            addressQueryInfo.setLng(location.getBigDecimal("lng"));
            JSONObject adInfo = dataResult.getJSONObject("ad_info");
            String nation = adInfo.getString("nation");
            String province = adInfo.getString("province");
            String city = adInfo.getString("city");
            String district = adInfo.getString("district");
            String adCode = adInfo.getString("adcode");
            addressQueryInfo.setNation(nation);
            String address = "未知";
            if (StringUtils.isNotBlank(province)) {
                addressQueryInfo.setProvince(province);
                address = province;
            }
            if (StringUtils.isNotBlank(city)) {
                addressQueryInfo.setCity(city);
                address += "-" + city;
            }
            if (StringUtils.isNotBlank(district)) {
                addressQueryInfo.setDistrict(district);
                address += "-" + district;
            }
            if (StringUtils.isNotBlank(adCode)) {
                addressQueryInfo.setAdCode(adCode);
            }
            addressQueryInfo.setAddress(address);
        }
        return addressQueryInfo;
    }

    @Override
    public RegionInfo getRegionInfo(String query,String region) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("query",query);
        if(StringUtils.isNoneBlank(region)){
            paramMap.put("region",region);
        }else {
            paramMap.put("region",query);
        }
        RegionInfo regionInfo = new RegionInfo();
        String ret = HttpUtil.get(bdMapRegionSearchApiUrl,paramMap);
        if(StrUtil.isNotBlank(ret)) {
            JSONObject jsonResData = JSONObject.parseObject(ret);
            if (jsonResData.getInteger("status") == 0) {
                JSONArray jsonArray = jsonResData.getJSONArray("results");
                for (Object o : jsonArray) {
                    JSONObject jsonObject = (JSONObject) o;
                    if (query.equals(jsonObject.getString("name"))) {
                        regionInfo.setName(jsonObject.getString("name"));
                        regionInfo.setAdCode(jsonObject.getString("adcode"));
                        JSONObject location = jsonObject.getJSONObject("location");
                        regionInfo.setLat(location.getBigDecimal("lat"));
                        regionInfo.setLng(location.getBigDecimal("lng"));
                        break;
                    }
                }
            }else {

            }
        }
        return regionInfo;
    }
}
