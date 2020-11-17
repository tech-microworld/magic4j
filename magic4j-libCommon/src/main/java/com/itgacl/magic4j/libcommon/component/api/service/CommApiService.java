package com.itgacl.magic4j.libcommon.component.api.service;

import com.itgacl.magic4j.libcommon.component.api.bean.AddressInfo;
import com.itgacl.magic4j.libcommon.component.api.bean.LocationInfo;
import com.itgacl.magic4j.libcommon.component.api.bean.RegionInfo;

public interface CommApiService {

    /**
     * 根据经纬度获取位置信息
     * @param longitude 经度
     * @param latitude 纬度
     * @return
     */
    LocationInfo getLocation(String longitude, String latitude);

    /**
     * 通过IP地址获取位置信息
     * @param ip
     * @return
     */
    AddressInfo getAddressByIP(String ip);

    RegionInfo getRegionInfo(String query,String region);
}
