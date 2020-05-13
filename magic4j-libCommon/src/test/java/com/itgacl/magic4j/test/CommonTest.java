package com.itgacl.magic4j.test;

import com.itgacl.magic4j.libcommon.util.RegExUtil;
import com.itgacl.magic4j.libcommon.util.ip.AddressUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
public class CommonTest {

    @Test
    public void test() {
        log.info("开始查询");
        System.out.println(AddressUtils.getAddress("106.35.112.88"));
        System.out.println(AddressUtils.getAddress("222.190.125.42"));
        System.out.println(AddressUtils.getAddress("206.77.131.86"));
        System.out.println(AddressUtils.getAddress("116.37.161.86"));
        System.out.println(AddressUtils.getAddress("136.27.231.86"));
        System.out.println(AddressUtils.getAddress("127.0.0.1"));
        System.out.println(AddressUtils.getAddress("116.22.198.116"));
        System.out.println(AddressUtils.getAddress("112.17.236.511"));
        log.info("查询完成");
    }

    @Test
    public void test2() {
        String url1 = "/sys/sysRole/{id}";
        String url2 = "/sys/sysRole/{id}/res";
        String url3 = "/sys/sysRole/{id}/res/tree";
        String url4 = "/sys/sysRole/{sysUserId}/role";
        String url5 = "/sys/sysLog/opera/log/{pageNo}/{pageSize}";

        String s1 = url1.replaceAll("/\\{.*}", "").replaceAll("/",":");
        String s2 = url2.replaceAll("/\\{.*}", "").replaceAll("/",":");
        String s3 = url3.replaceAll("/\\{.*}", "").replaceAll("/",":");
        String s4 = url4.replaceAll("/\\{.*}", "").replaceAll("/",":");
        String s5 = url5.replaceAll("/\\{.*}", "").replaceAll("/",":");
        /*List<String> stringList1 = RegExUtil.extract(url4);
        for (String s:stringList1){
            url4 =  url4.replaceAll("\\{"+s+"}", s).replaceAll("/",":");
        }*/
        System.out.println(s1);
        System.out.println(s2);
        System.out.println(s3);
        System.out.println(s4);
        System.out.println(s5);

    }
}
