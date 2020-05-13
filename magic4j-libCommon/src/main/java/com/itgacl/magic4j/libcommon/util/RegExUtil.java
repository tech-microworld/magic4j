package com.itgacl.magic4j.libcommon.util;

import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Auther: 孤傲苍狼
 * @Date: 2019/12/5 17:55
 * @Description: 提取{}之间的内容
 */
public class RegExUtil {

    private static final String start = "{";
    private static final String end = "}";
    private static final String start2 = "[";
    private static final String end2 = "]";

    public static List<String> extract(String str) {
        String patern = "(?<=\\" + start + ")[^\\" + end + "]+";
        Pattern pattern = Pattern.compile(patern);
        Matcher matcher = pattern.matcher(str);
        List<String> result = new LinkedList<>();
        while (matcher.find()) {
            result.add(matcher.group());
        }
        return result;
    }

    public static List<String> extract2(String str) {
        String patern = "(?<=\\" + start2 + ")[^\\" + end2 + "]+";
        Pattern pattern = Pattern.compile(patern);
        Matcher matcher = pattern.matcher(str);
        List<String> result = new LinkedList<>();
        while (matcher.find()) {
            result.add(matcher.group());
        }
        return result;
    }


    public static List<String> extract2(String str, String start, String end) {
        String patern = "(?<=" + start + ")[^" + end + "]+";
        Pattern pattern = Pattern.compile(patern);
        Matcher matcher = pattern.matcher(str);
        List<String> result = new LinkedList<>();
        while (matcher.find()) {
            result.add(matcher.group());
        }
        return result;
    }
}