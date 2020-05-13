package com.itgacl.ssh2.jsch.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

/**
 * <p>ClassName: GUIDUtil<p>
 * <p>Description: 生成页面SELECT标签HTML帮助类。
 * 实现背景：现公司数据库ID使用32位UUID，大部份由HIBERNATE自动生成，
 * 但是如果不是由HIBERNATE自动生成，可以使用此类生成<p>
 *
 * @author xdp
 * @version 1.0 V
 * @createTime 2014-6-5 下午02:32:07
 */
public class GUIDUtil {
    private static Random myRand;
    private static SecureRandom mySecureRand;

    private static String s_id;

    static {
        mySecureRand = new SecureRandom();

        long secureInitializer = mySecureRand.nextLong();
        myRand = new Random(secureInitializer);

        try {
            s_id = InetAddress.getLocalHost().toString();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }


    public GUIDUtil() {
    }


    /**
     * MethodName: genRandomGUID
     * Description: 引用Random生成32位UUID
     *
     * @return String
     * @author caiwh
     */
    public static String genRandomGUID() {
        return genRandomGUID(false);
    }


    /**
     * MethodName: genRandomGUID
     * Description: 根据boolean对象，如果为true引用java.security.SecureRandom生成32位UUID,
     * 如果为false引用Random生成32位UUID
     *
     * @param secure boolean对象
     * @return String
     * @author caiwh
     */
    public static String genRandomGUID(boolean secure) {
        String valueBeforeMD5 = "";
        String valueAfterMD5 = "";

        MessageDigest md5 = null;
        StringBuffer sbValueBeforeMD5 = new StringBuffer();

        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Error: " + e);
            return valueBeforeMD5;
        }

        long time = System.currentTimeMillis();
        long rand = 0;
        if (secure) {
            rand = mySecureRand.nextLong();
        } else {
            rand = myRand.nextLong();
        }
        System.out.println(rand);
        sbValueBeforeMD5.append(s_id);
        sbValueBeforeMD5.append(":");
        sbValueBeforeMD5.append(Long.toString(time));
        sbValueBeforeMD5.append(":");
        sbValueBeforeMD5.append(Long.toString(rand));
        valueBeforeMD5 = sbValueBeforeMD5.toString();
        md5.update(valueBeforeMD5.getBytes());
        byte[] array = md5.digest();
        String strTemp = "";
        for (int i = 0; i < array.length; i++) {
            strTemp = (Integer.toHexString(array[i] & 0XFF));
            if (strTemp.length() == 1) {
                valueAfterMD5 = valueAfterMD5 + "0" + strTemp;
            } else {
                valueAfterMD5 = valueAfterMD5 + strTemp;
            }
        }

        return valueAfterMD5.toUpperCase();
    }
}
