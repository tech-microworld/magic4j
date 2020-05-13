package com.itgacl.magic4j.libcommon.util.ip;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.lionsoul.ip2region.DataBlock;
import org.lionsoul.ip2region.DbConfig;
import org.lionsoul.ip2region.DbSearcher;
import org.lionsoul.ip2region.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Method;

/**
 * 获取地址类
 */
public class AddressUtils {
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

    //腾讯根据IP获取用户定位信息接口
    private static final String IP_URL = "https://apis.map.qq.com/ws/location/v1/ip?ip=$IP&key=B4SBZ-J2VWD-VXJ4G-HFWMA-4E6RE-YGBUM";

    public static String getRealAddressByIP(String ip) {
        String address = "未知";
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }
        String rspStr = HttpUtil.get(IP_URL.replace("$IP", ip));
        if (StringUtils.isEmpty(rspStr)) {
            log.error("获取地理位置异常 {}", ip);
            return address;
        }
        JSONObject jsonResData = JSONObject.parseObject(rspStr);
        if (jsonResData.getInteger("status") == 0) {
            JSONObject dataResult = jsonResData.getJSONObject("result");
            JSONObject adInfo = dataResult.getJSONObject("ad_info");
            String province = adInfo.getString("province");
            String city = adInfo.getString("city");
            String district = adInfo.getString("district");
            address = province + "-" + city;
            if (StringUtils.isNotEmpty(district)) {
                address += "-" + district;
            }
            return address;
        } else {
            log.error("获取地理位置失败 {}", ip);
            return address;
        }
        /**
         * https://apis.map.qq.com/ws/location/v1/ip?ip=116.22.198.45&key=B4SBZ-J2VWD-VXJ4G-HFWMA-4E6RE-YGBUM
         * {
         "status":0,
         "message":"query ok",
         "result":{
         "ip":"116.22.198.45",
         "location":{
         "lat":23.12463,
         "lng":113.36199
         },
         "ad_info":{
         "nation":"中国",
         "province":"广东省",
         "city":"广州市",
         "district":"天河区",
         "adcode":440106
         }
         }
         }
         */
    }

    /**
     * 使用ip2region.db可离线可快速免费查询IP地址库
     * 参考：https://www.jianshu.com/p/95ba828d9a8c
     * @param ip
     * @return
     */
    public static String getAddress(String ip) {
        try {
            //db
            ClassPathResource resource = new ClassPathResource("/ip2region/ip2region.db");
            String tmpDir = System.getProperties().getProperty("java.io.tmpdir");
            String dbPath = tmpDir + "ip.db";
            File file = new File(dbPath);
            InputStream inputStream = resource.getInputStream();
            FileUtils.copyInputStreamToFile(inputStream, file);

            //查询算法
            int algorithm = DbSearcher.BTREE_ALGORITHM; //B-tree
            //DbSearcher.BINARY_ALGORITHM //Binary
            //DbSearcher.MEMORY_ALGORITYM //Memory

            DbConfig config = new DbConfig();
            DbSearcher searcher = new DbSearcher(config, file.getPath());

            //define the method
            Method method = null;
            switch (algorithm) {
                case DbSearcher.BTREE_ALGORITHM:
                    method = searcher.getClass().getMethod("btreeSearch", String.class);
                    break;
                case DbSearcher.BINARY_ALGORITHM:
                    method = searcher.getClass().getMethod("binarySearch", String.class);
                    break;
                case DbSearcher.MEMORY_ALGORITYM:
                    method = searcher.getClass().getMethod("memorySearch", String.class);
                    break;
            }

            DataBlock dataBlock;
            if (!Util.isIpAddress(ip)) {
                System.out.println("Error: Invalid ip address");
            }
            dataBlock = (DataBlock) method.invoke(searcher, ip);

            return dataBlock.getRegion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
