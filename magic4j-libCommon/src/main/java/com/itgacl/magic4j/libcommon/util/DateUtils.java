/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */

package com.itgacl.magic4j.libcommon.util;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * 
 * @author 徐达沛
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

    private static String[] parsePatterns = {
            "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd",
            "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd",
            "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM","yyyyMMddHHmmss","yyyyMMdd"
    };

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd）
     */
    public static String getDate() {
        return getDate("yyyy-MM-dd");
    }

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String getDate(String pattern) {
        return DateFormatUtils.format(new Date(), pattern);
    }

    /**
     * 获取当前时间戳
     *
     * @return
     */
    public static long currentTimeMillis() {
        return System.currentTimeMillis();
    }

    /**
     * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String formatDate(Date date, Object... pattern) {
        String formatDate;
        if (pattern != null && pattern.length > 0) {
            formatDate = DateFormatUtils.format(date, pattern[0].toString());
        } else {
            formatDate = DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
        }
        return formatDate;
    }

    /**
     * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
     */
    public static String formatDateTime(Date date) {
        return formatDate(date, "yyyy-MM-dd HH:mm:ss");
    }
    /**
     * 得到当前时间字符串 格式（HH:mm:ss）
     */
    public static String getTime() {
        return formatDate(new Date(), "HH:mm:ss");
    }

    /**
     * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
     */
    public static String getDateTime() {
        return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 得到当前年份字符串 格式（yyyy）
     */
    public static int getYear() {
        return getYear(new Date());
    }

    /**
     * 获得指定日期年份
     *
     * @param date
     * @return
     */
    public static int getYear(Date date) {
        Calendar cal = Calendar.getInstance();
		cal.setTime(date);
        return cal.get(Calendar.YEAR);
    }

    /**
     * 得到当前月份字符串 格式（MM）
     */
    public static int getMonth() {
        return getMonth(new Date());
    }

	public static int getMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}

    /**
     * 得到当天字符串 格式（dd）
     */
    public static int getDay() {
        return getDay(new Date());
    }

	public static int getDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DATE);
	}

	public static int getHour() {
		return getHour(new Date());
	}

	public static int getHour(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.HOUR);
	}


    /**
     * 得到当前星期字符串 格式（E）星期几
     */
    public static String getWeek() {
        return formatDate(new Date(), "E");
    }

    /**
     * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
     * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
     * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
     */
    public static Date parseDate(Object str) {
        if (str == null) {
            return null;
        }
        try {
            return parseDate(str.toString(), parsePatterns);
        } catch (ParseException e) {
            return null;
        }
    }

    /**
     * 获取过去的天数
     * 
     * @param date
     * @return
     */
    public static long pastDays(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / (24 * 60 * 60 * 1000);
    }

    /**
     * 获取过去的小时
     * 
     * @param date
     * @return
     */
    public static long pastHour(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / (60 * 60 * 1000);
    }

    /**
     * 获取过去的分钟
     * 
     * @param date
     * @return
     */
    public static long pastMinutes(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / (60 * 1000);
    }
    /**
     * 获取过去的毫秒
     *
     * @param date
     * @return
     */
    public static long pastMillisecond(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t ;
    }
    /**
     * 获取过去的秒
     *
     * @param date
     * @return
     */
    public static long pastSecond(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / 1000;
    }

    /**
     * 转换为时间（天,时:分:秒.毫秒）
     * 
     * @param timeMillis
     * @return
     */
    public static String formatDateTime(long timeMillis) {
        long day = timeMillis / (24 * 60 * 60 * 1000);
        long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
        long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
        long sss = (timeMillis - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min * 60 * 1000
                - s * 1000);
        return (day > 0 ? day + "," : "") + hour + ":" + min + ":" + s + "." + sss;
    }
    /**
     * 得到当天的开始时间 （yyyy-MM-dd 00:00:00）
     */
    public static Date getStartForDay() {
        return getStartForDay(new Date());
    }
    /**
     * 得到指定日期当天的开始时间 （yyyy-MM-dd 00:00:00.000）
     */
    public static Date getStartForDay(Date date) {
        Calendar todayStart = Calendar.getInstance();
        todayStart.setTime(date);
        todayStart.set(Calendar.HOUR_OF_DAY, 0);
        todayStart.set(Calendar.MINUTE, 0);
        todayStart.set(Calendar.SECOND, 0);
        todayStart.set(Calendar.MILLISECOND, 0);
        return todayStart.getTime();
    }
    /**
     * 得到当天的结束开始时间 （yyyy-MM-dd 23:59:59.999）
     */
    public static Date getEndForDay() {
        return getEndForDay(new Date());
    }
    /**
     * 得到指定日期当天的结束时间 （yyyy-MM-dd 23:59:59.999）
     */
    public static Date getEndForDay(Date date) {
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.setTime(date);
        todayEnd.set(Calendar.HOUR_OF_DAY, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 59);
        todayEnd.set(Calendar.MILLISECOND, 999);
        return todayEnd.getTime();
    }
    /**
     * 得到当天的结束开始时间 （yyyy-MM-dd 23:59:59.999）
     */
    public static Date getEndDateTimeForDay() {
        return getEndDateTimeForDay(new Date());
    }
    /**
     * 得到指定日期当天的结束时间 （yyyy-MM-dd 23:59:59.0）
     */
    public static Date getEndDateTimeForDay(Date date) {
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.setTime(date);
        todayEnd.set(Calendar.HOUR_OF_DAY, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 59);
        todayEnd.set(Calendar.MILLISECOND, 0);
        return todayEnd.getTime();
    }
    /**
     * 得到指定日期当天的开始时间 （yyyy-MM-01 00:00:00.000）
     */
    public static Date getStartOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
    /**
     * 得到指定日期当天的结束时间 （yyyy-MM-dd 23:59:59.0）
     */
    public static Date getEndDateTimeOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DAY_OF_MONTH,0);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
    /**
     * 获取两个日期之间的天数
     * 
     * @param before
     * @param after
     * @return
     */
    public static double getDistanceOfTwoDate(Date before, Date after) {
        long beforeTime = before.getTime();
        long afterTime = after.getTime();
        return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
    }
    /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return long
     */
    public static long getDaySub(String beginDateStr,String endDateStr) {
        long day = 0;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date beginDate;
        Date endDate;
        try {
            beginDate = format.parse(beginDateStr);
            endDate = format.parse(endDateStr);
            day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
            //System.out.println("相隔的天数="+day);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return day;
    }

    /**
     * 返回当前字符串型日期
     *
     * @return String 返回的字符串型日期
     */
    public static String getCurDate() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = simpledateformat.format(calendar.getTime());
        return strDate;
    }

    /**
     * 返回当前字符串型日期
     *
     * @return String 返回的字符串型日期
     */
    public static Date getCurDate(String format) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpledateformat = new SimpleDateFormat(format);
        String strDate = simpledateformat.format(calendar.getTime());
        return parseDate(strDate, format);
    }

    /***
     * 日期减一天、加一天
     *
     * @param option
     *            传入类型 pro：日期减一天，next：日期加一天
     * @param _date
     *            2014-11-24
     * @return 减一天：2014-11-23或(加一天：2014-11-25)
     */
    public static String checkOption(String option, String _date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cl = Calendar.getInstance();
        Date date = null;
        try {
            date = (Date) sdf.parse(_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        cl.setTime(date);
        if ("pre".equals(option)) {
            // 时间减一天
            cl.add(Calendar.DAY_OF_MONTH, -1);

        } else if ("next".equals(option)) {
            // 时间加一天
            cl.add(Calendar.DAY_OF_YEAR, 1);
        } else {
            // do nothing
        }
        date = cl.getTime();
        return sdf.format(date);
    }

    /**
     * 获取传入参数类型yyyy-MM的日期格式，并返回相同格式下个月的字符串
     * @param month
     * @return
     */
    public static String nextMonth(String month){
        String[] arr = month.split("-");
        if (arr.length >=2){
            //输入的是12月份
            if ("12".equals(arr[1])){
                //当前年份加1，当前月份变为1
                arr[1] = "1";
            }else {
                //其它月份只需要月份加1
                int newMonth = Integer.parseInt(arr[1]) + 1;
                arr[1] = String.valueOf(newMonth);
            }
            return arr[0] + "-" + arr[1];
        }else {
            return month;
        }
    }

    /**
     * 返回汉语星期
     * @param date
     * @return
     */
    public static String getWeekOfDate(Date date) {
        String[] weekOfDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar calendar = Calendar.getInstance();
        if(date != null){
            calendar.setTime(date);
        }
        int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0){
            w = 0;
        }
        return weekOfDays[w];
    }

    public static String getCurrentTime() {
        return formatDate(new Date(), "yyyyMMddHHmmss");
    }
}
