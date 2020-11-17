package com.itgacl.magic4j.libcommon.util;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import org.apache.commons.beanutils.BeanUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ConversionUtil {


    /**
     * String转换为Integer
     * @param str
     * @return
     */
    public static Integer toInteger(String str){
        if (str == null) {
            return null;
        }
        try {
            return Integer.valueOf(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * String转换为int
     * @param str
     * @return
     */
    public static int toInt(String str){
        if(str == null){
            return 0;
        }
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * String转换为int
     * @param str
     * @return
     */
    public static long toLong(String str){
        if(str == null){
            return 0L;
        }
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return 0L;
    }

    /**
     * String转换为double
     * @param str
     * @return
     */
    public static double toDouble(String str){
        if(str == null){
            return 0.0;
        }
        try {
            return Double.parseDouble(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 判断对象是否为空，是返回true, 否返回false
     * @param object
     * @return
     */
    public static boolean isNull(Object object){
        return null == object ;
    }


    /**
     * 判断对象是否为非空， 非空返回true，空返回false
     * @param object
     * @return
     */
    public static boolean isNotNull(Object object){
        return null != object ;
    }

    /**
     * 判断集合是否为空， 空返回true, 非空 返回 false
     * @param c
     * @return
     */
    public static boolean isEmptyCollection(Collection<? extends Object> c){
        return isNull(c) || c.isEmpty();
    }

    /**
     * 判断集合是否为非空， 非空返回true, 空 返回 false
     * @param c
     * @return
     */
    public static boolean isNotEmptyCollection(Collection<? extends Object> c){
        return !isEmptyCollection(c);
    }

    /**
     * 判断数组是否为空 ，空返回true 非空 false
     * @param objects
     * @return
     */
    public static boolean isEmptyArray(Object[] objects){
        return isNull(objects) ||  objects.length == 0;
    }
    /**
     * 判断数组是否为空 ，空返回true 非空 false
     * @param objects
     * @return
     */
    public static boolean isNotEmptyArray(Object[] objects){
        return isNotNull(objects)  && objects.length > 0;
    }

    /**
     * 参数是否非空校验 非空返回true, 空返回false
     * @param objects
     * @return
     */
    public static boolean isNotEmptyParameter(Object...objects){
        for (Object object : objects){
            if(isNull(object)){
                return false;
            }
            if(object instanceof String && "".equals(object)){
               return false;
            }
            if (object instanceof List) {
                clearNull(((List) object));
            }
            if (object instanceof Collection && ((Collection) object).size() == 0) {
                return false;
            }
            if (object instanceof Map && ((Map) object).size() == 0) {
                return false;
            }
        }
        return true;
    }


    /**
     * 参数是否为空 空返回true，非空返回false
     * @param objects
     * @return
     */
    public static boolean isEmptyParameter(Object...objects){
        for (Object object : objects){
            if(isNull(object)){
                return true;
            }
            if(object instanceof String && "".equals(object)){
                return true;
            }
            if (object instanceof List) {
                clearNull(((List) object));
            }
            if (object instanceof Collection && ((Collection) object).size() == 0) {
                return true;
            }
            if (object instanceof Map && ((Map) object).size() == 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * 参数是否包含空值 包含返回true，不包含返回false
     * @param objects
     * @return
     */
    public static boolean isContainEmptyParam(Object... objects){
        for (Object object : objects){
            if (isNull(object)) return true;
            if(object instanceof String){
                if("".equals(object))return true;
            }

        }
        return false;
    }
    /**
     * 判断第二个格式的参数中是否包含第一个参数
     * 即objects中是否包含t
     * @param objects
     * @return
     */
    public static  boolean isContain(Object t,Object... objects){
        for (Object object : objects){
            if (Objects.equals(t,object)) return true;
        }
        return false;
    }
    /**
     * 判断第二个格式的参数中是否不包含第一个参数
     * 即objects中是否 不包含t
     * @param objects
     * @return
     */
    public static  boolean isNotContain(Object t,Object... objects){
        for (Object object : objects){
            if (Objects.equals(t,object)) return false;
        }
        return true;
    }


    /**
     * 根据日期获取星期几
     * @param date
     * @return
     */
    public static String getWeek(Date date){
        return new SimpleDateFormat("EEEE").format(date);
    }

    /**
     * List<String>转换为String[]
     * @param list
     * @return
     */
    public static String[] listToArray(List<String> list){
        return isNotEmptyCollection(list) ? list.toArray(new String[list.size()]) : new String[0];
    }


    /**
     * String[] 转换 List<String>
     * @param strArray
     * @return
     */
    public static List<String> arrayToList(String[] strArray){
        return isEmptyArray(strArray) ? new ArrayList<String>() : Arrays.asList(strArray);
    }

    /**
     * String[]数组去除重复元素
     * @param array
     * @return
     */
    public static String[] distinctArray(String[] array){
        if(isEmptyArray(array)){
            return new String[0];
        }
        List<String> arrayList = Arrays.asList(array);
        TreeSet<String> set = new TreeSet<>();
        set.addAll(arrayList);
        return set.toArray(new String[set.size()]);
    }

    /**
     * List<String> 去除重复元素,修改原list
     * @param list
     * @return
     */
    public static<T> void distinctList(List<T> list){
        if(isEmptyCollection(list)){
            return ;
        }
        TreeSet<T> set = new TreeSet<>();
        set.addAll(list);
        list.clear();
        list.addAll(set);
    }
    /**
     * collection<String> 去除重复元素,不修改原list,返回新的list集合
     * @param collection
     * @param vClass 新集合的实现类
     * @return
     */
    public static<T,V extends Collection> V distinctCollectionCopy(Collection<T> collection,Class<V> vClass) throws Exception {
        V tList =  vClass.newInstance();
        if(collection.isEmpty()){
            return tList;
        }
        TreeSet<T> set = new TreeSet<>();
        set.addAll(collection);
        tList.addAll(set);
        return tList;
    }

    /**
     * 去除空值
     * @param collection
     * @param <T>
     * @return 发生改变则返回true
     */
    public static <T> boolean clearEmpty(Collection<T> collection){
        if (collection == null) return false;
        boolean flag = false;
        Iterator<T> it =collection.iterator();
        while (it.hasNext()){
            T t = it.next();
            if (t == null || "".equals(t)){
                it.remove();
                flag = true;
            }
        }
        return flag;
    }
    /**
     * 去除null
     * @param collection
     * @param <T>
     * @return 发生改变则返回true
     */
    public static <T> boolean clearNull(Collection<T> collection){
        if (collection == null) return false;
        boolean flag = false;
        Iterator<T> it = collection.iterator();
        while (it.hasNext()){
            if (it.next() == null){
                it.remove();
                flag = true;
            }
        }
        return flag;
    }
    /**
     * 判断2个List集合是否有共同的元素 存在共同元素返回true
     * @param list1
     * @param list2
     * @return
     */
    public static boolean isContainsOneValue(List<String> list1,List<String> list2){
        for (String str : list1){
            if(list2.contains(str)){
               return true;
            }
        }
        return false;
    }



    /**
     * 自定义时间
     * field : 类型 年月日时分秒
     * amount: 增加量
     * @param date
     * @param field
     * @param amount
     * @return
     */
    public static Date getCustomDate(Date date,int field, int amount){
        if(date == null){
            date = new Date();
        }
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.add(field, amount);
        date = ca.getTime();
        return date;
    }

    public static Date toDayStartTime() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new Date()));
    }

    public static Date toDayEndTime() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new Date()));
    }


    /**
     * 利用org.apache.commons.beanutils 工具类实现 Map --> Bean
     * @param map
     * @param obj
     */
    public static void mapToBean(Map<String, Object> map, Object obj){
        if (map == null || obj == null) {
            return;
        }
        try {
            BeanUtils.populate(obj, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * bean的属性封装为map
     * @param obj
     * @return
     */
    public static Map<String, Object> beanToMap(Object obj) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                // 过滤class属性
                if (!key.equals("class")) {
                    // 得到property对应的getter方法
                    Method getter = property.getReadMethod();
                    Object value = getter.invoke(obj);
                    map.put(key, value);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 根据指定参数bean转map
     * bean不包含指定参数，返回null
     * @param obj
     * @param keys 类似"a,b,c,d"
     * @return
     */
    public static Map<String, Object> beanToMap(Object obj,String keys) {
        Map<String, Object> map = new HashMap<String, Object>();
        if(isEmptyParameter(obj,keys)){
            return map;
        }
        List<String> keyList = Arrays.asList(keys.split(","));
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                // 过滤class属性
                if (!key.equals("class") && keyList.contains(key)) {
                    // 得到property对应的getter方法
                    Method getter = property.getReadMethod();
                    Object value = getter.invoke(obj);
                    map.put(key, value);
                }

            }
            //如果bean不包含参数keys指定的属性，返回null
            for (String key : keyList){
                if(!map.containsKey(key)){
                    map.put(key,null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }


    /**
     * 删除目录及目录下的文件
     * @param dir 要删除的目录的文件路径
     * @return 目录删除成功返回true，否则返回false
     */
    public static boolean deletedirectory(String dir) {
        if(ConversionUtil.isEmptyParameter(dir)){
            return false;
        }
        // 如果dir不以文件分隔符结尾，自动添加文件分隔符
        if(!dir.endsWith(File.separator))
            dir = dir + File.separator;
        File dirfile = new File(dir);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if((!dirfile.exists()) || (!dirfile.isDirectory())) {
            return false;
        }
        boolean flag = true;
        // 删除文件夹中的所有文件包括子目录
        File[] files = dirfile.listFiles();
        for(File file : files) {
            // 删除子文件
            if(!file.getName().equals("README.md")){
                file.delete();
            }
        }
        return true;
    }

    /**
     * 字母转数字
     * A-1
     * B-2
     * ...
     * 多个字母的字符串取第一个字符转数字
     * @param letter
     * @return
     */
    public static int letter2Number(String letter){
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        if (isEmptyParameter(letter))
            throw new IllegalArgumentException();
//        if (!letter.matches("^\\w+$"))
//            throw new IllegalArgumentException();
        return str.indexOf(letter.toUpperCase().charAt(0));
    }

    /**
     * date2比date1多的天数
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDays(Date date1,Date date2)
    {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int day1= cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);

        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if(year1 != year2) //同一年
        {
            int timeDistance = 0 ;
            for(int i = year1 ; i < year2 ; i ++)
            {
                if(i%4==0 && i%100!=0 || i%400==0) //闰年
                {
                    timeDistance += 366;
                }
                else //不是闰年
                {
                    timeDistance += 365;
                }
            }

            return timeDistance + (day2-day1) ;
        }
        else //不同年
        {
            System.out.println("判断day2 - day1 : " + (day2-day1));
            return day2-day1;
        }
    }


    /**
     * 随机生成指定长度的数字组成字符串
     * @param length 字符串长度 默认6
     * @return
     */
    public static String randomStrNum(int length){
        String strNum = "";
        length = length == 0 ? 6 : length;
        for (int i=0;i<length;i++)
        {
            strNum += new Random().nextInt(10);
        }
        return strNum;
    }

    public static String getRandomString(int length){
        //定义一个字符串（A-Z，a-z，0-9）即62位；
        String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
        //由Random生成随机数
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        //长度为几就循环几次
        for(int i=0; i<length; ++i){
            //产生0-61的数字
            int number=random.nextInt(62);
            //将产生的数字通过length次承载到sb中
            sb.append(str.charAt(number));
        }
        //将承载的字符转换成字符串
        return sb.toString();
    }

    public static Long rateToLong(String rate){
        return new BigDecimal(rate).multiply(new BigDecimal(10000)).setScale(0, BigDecimal.ROUND_HALF_UP).longValue();
    }

    public static String rateToString(Long rate){
        return new BigDecimal(rate).divide(new BigDecimal(10000), 4, BigDecimal.ROUND_HALF_UP).toString();
    }

    /**
     * 2数百分比
     * @param num1
     * @param num2
     * @param decimal
     * @return
     */
    public static String getPercentage(int num1, int num2,int decimal){
        // 创建一个数值格式化对象
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 设置精确到小数点后2位
        numberFormat.setMaximumFractionDigits(decimal);
        return numberFormat.format((float)num1/(float)num2*100);
    }

    /**
     * 反射复制bean(由于服务之间调用，bean里的某个字段可能传空字符""，并不是null)
     * objFrom：要复制的bean
     * objTo:要转换的bean
     * ignoreKey:忽略的属性
     * */
    public static Object beanCopy(Object objFrom,Object objTo,String ignoreKey){
        Class clsFrom=null;
        Class clsTo=null;
        try {
            clsFrom = Class.forName(objFrom.getClass().getName());
            clsTo = Class.forName(objTo.getClass().getName());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //获取两个实体类的所有属性
        Field[] objFromFields = clsFrom.getDeclaredFields();
        Field[] objToFields = clsTo.getDeclaredFields();
        //遍历赋值
        try {
            for (Field formField : objFromFields) {
                //如果是属性ignoreKey不赋值
                if(formField.getName().equals(ignoreKey))
                    continue;

                Object value = null;
                //设置对象的访问权限，保证对private的属性的访问
                formField.setAccessible(true);
                value = formField.get(objFrom);

                //如果是null不赋值
                if (ConversionUtil.isNotEmptyParameter(value)) {
                    for (Field toField : objToFields) {
                        //找相同的属性
                        if(formField.getName().equals(toField.getName())){
                            toField.setAccessible(true);
                            toField.set(objTo, value);
                            break;
                        }
                    }

                }
            }
            return objTo;
        } catch (Exception e) {
            return null;
        }
    }

    public static void beanCopy(Object objFrom,Object objTo){
        Class clsFrom=null;
        Class clsTo=null;
        try {
            clsFrom = Class.forName(objFrom.getClass().getName());
            clsTo = Class.forName(objTo.getClass().getName());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //获取两个实体类的所有属性
        Field[] objFromFields = clsFrom.getDeclaredFields();
        Field[] objToFields = clsTo.getDeclaredFields();
        //遍历赋值
        try {
            for (Field formField : objFromFields) {
                //如果是属性ignoreKey不赋值
                if(formField.getName().equals("serialVersionUID"))
                    continue;
                Object value = null;
                //设置对象的访问权限，保证对private的属性的访问
                formField.setAccessible(true);
                value = formField.get(objFrom);

                //如果是null不赋值
                if (ConversionUtil.isNotEmptyParameter(value)) {
                    for (Field toField : objToFields) {
                        //找相同的属性
                        if(formField.getName().equals(toField.getName())){
                            toField.setAccessible(true);
                            toField.set(objTo, value);
                            break;
                        }
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Map<String,Object> JSONObjectToMap(Object object){
        return JSONObject.parseObject(JSONObject.toJSONString(object), Feature.OrderedField);
    }

    /**
     * 转换为Long数组<br>
     *
     * @param str 被转换的值
     * @return 结果
     */
    public static Long[] toLongArray(String str) {
        return toLongArray(",", str);
    }

    /**
     * 转换为Long数组<br>
     *
     * @param split 分隔符
     * @param str   被转换的值
     * @return 结果
     */
    public static Long[] toLongArray(String split, String str) {
        if (StrUtil.isEmpty(str)) {
            return new Long[]{};
        }
        String[] arr = str.split(split);
        final Long[] longs = new Long[arr.length];
        for (int i = 0; i < arr.length; i++) {
            final Long v = toLong(arr[i]);
            longs[i] = v;
        }
        return longs;
    }

    /**
     * 转换为Long集合<br>
     *
     * @param str 结果被转换的值
     * @return 结果
     */
    public static List<Long> toLongList(String str) {
        return Arrays.asList(toLongArray(str));
    }

    /**
     * 转换为Long集合<br>
     *
     * @param split 分隔符
     * @param str   被转换的值
     * @return 结果
     */
    public static List<Long> toLongList(String split, String str) {
        return Arrays.asList(toLongArray(split, str));
    }


}
