package com.itgacl.magic4j.libcommon.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class RandomUtils {
    public static final String allChar = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String letterChar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String numberChar = "0123456789";

    /**
     * 返回一个定长的随机字符串(只包含大小写字母、数字)
     * @return 随机字符串
     */
    public static String generateString() {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i <= 2; i++) {
            sb.append(numberChar.charAt(random.nextInt(numberChar.length())));
        }
        return sb.toString();
    }

    public static String getDateString() {
        @SuppressWarnings("unused")
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        String reTime = format.format(date);
        StringBuffer sb = new StringBuffer(reTime);
        String nDate = sb.substring(2, 8);
        return nDate;
    }

    public static String getZD(String strName) {
        if (strName.equals("惠州")) {
            return "HZ";
        } else if (strName.equals("深圳")) {
            return "SZ";
        } else if (strName.equals("坪山")) {
            return "PS";
        } else if (strName.equals("宝龙")) {
            return "BL";
        } else if (strName.equals("上海")) {
            return "SH";
        } else if (strName.equals("北京")) {
            return "BJ";
        } else if (strName.equals("葵涌")) {
            return "KC";
        } else {
            return "error";
        }
    }

    public static String getFuction(String strName) {
        if (strName.equals("新添")) {
            return "XT";
        } else if (strName.equals("报废")) {
            return "BF";
        } else if (strName.equals("冲销")) {
            return "CX";
        } else if (strName.equals("清理")) {
            return "QL";
        } else if (strName.equals("调拨")) {
            return "DB";
        } else if (strName.equals("借用")) {
            return "JY";
        } else if (strName.equals("送样")) {
            return "SY";
        } else if (strName.equals("试产")) {
            return "SC";
        } else if (strName.equals("借出")) {
            return "JC";
        } else {
            return "error";
        }
    }

    public static String getBicker(String str, String str1) {
        String str2 = RandomUtils.getZD(str);
        String str3 = RandomUtils.getFuction(str1);
        String date = RandomUtils.getDateString();
        String num = RandomUtils.generateString();
        StringBuffer bf = new StringBuffer(str2);
        bf.append(str3);
        bf.append(date);
        String bicker = bf.append(num).toString();
        return bicker;
    }

    /**
     * 返回一个定长的随机纯字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateMixString(int length) {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(allChar.charAt(random.nextInt(letterChar.length())));
        }
        return sb.toString();
    }

    /**
     * 返回一个定长的随机纯大写字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateLowerString(int length) {
        return generateMixString(length).toLowerCase();
    }

    /**
     * 返回一个定长的随机纯小写字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateUpperString(int length) {
        return generateMixString(length).toUpperCase();
    }

    /**
     * 生成一个定长的纯0字符串
     *
     * @param length 字符串长度
     * @return 纯0字符串
     */
    public static String generateZeroString(int length) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            sb.append('0');
        }
        return sb.toString();
    }

    /**
     * 根据数字生成一个定长的字符串，长度不够前面补0
     *
     * @param num       数字
     * @param fixdlenth 字符串长度
     * @return 定长的字符串
     */
    public static String toFixdLengthString(long num, int fixdlenth) {
        StringBuffer sb = new StringBuffer();
        String strNum = String.valueOf(num);
        if (fixdlenth - strNum.length() >= 0) {
            sb.append(generateZeroString(fixdlenth - strNum.length()));
        } else {
            throw new RuntimeException("将数字" + num + "转化为长度为" + fixdlenth + "的字符串发生异常！");
        }
        sb.append(strNum);
        return sb.toString();
    }

    /**
     * 根据数字生成一个定长的字符串，长度不够前面补0
     *
     * @param num       数字
     * @param fixdlenth 字符串长度
     * @return 定长的字符串
     */
    public static String toFixdLengthString(int num, int fixdlenth) {
        StringBuffer sb = new StringBuffer();
        String strNum = String.valueOf(num);
        if (fixdlenth - strNum.length() >= 0) {
            sb.append(generateZeroString(fixdlenth - strNum.length()));
        } else {
            throw new RuntimeException("将数字" + num + "转化为长度为" + fixdlenth + "的字符串发生异常！");
        }
        sb.append(strNum);
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(getDateString());
        System.out.println(generateString());
        // System.out.println(getBicker());
        System.out.println(generateMixString(16));
        System.out.println(generateLowerString(16));
        System.out.println(generateUpperString(16));
        System.out.println(generateZeroString(15));
        System.out.println(toFixdLengthString(123, 15));
        System.out.println(toFixdLengthString(123L, 15));
    }
}





