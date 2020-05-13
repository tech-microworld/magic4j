package com.itgacl.ssh2.jsch.util;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gacl on 2017/10/17.
 */
public class FileUtil {

    /**
     * 输入流转字节数组
     * @param inStream
     * @return
     * @throws IOException
     */
    public static byte[] input2ByteArray(InputStream inStream)
            throws IOException {
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100];
        int rc = 0;
        while ((rc = inStream.read(buff, 0, 100)) > 0) {
            swapStream.write(buff, 0, rc);
        }
        byte[] in2b = swapStream.toByteArray();
        swapStream.close();
        return in2b;
    }

    /**
     * 文件转字节数组
     * @param file
     * @return
     * @throws IOException
     */
    public static byte[] file2ByteArray(File file) throws IOException {
        File f = file;
        if (!f.exists()) {
            throw new FileNotFoundException("file not exists");
        }
        ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
        BufferedInputStream in = null;
        try {
            in = new BufferedInputStream(new FileInputStream(f));
            int buf_size = 1024;
            byte[] buffer = new byte[buf_size];
            int len = 0;
            while (-1 != (len = in.read(buffer, 0, buf_size))) {
                bos.write(buffer, 0, len);
            }
            return bos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            try {
                if(in != null){
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            bos.close();
        }
    }

    /**
     * 文件转字节数组
     * @param filePath
     * @return
     * @throws IOException
     */
    public static byte[] file2ByteArray(String filePath) throws IOException {
        InputStream in = new FileInputStream(filePath);
        return input2ByteArray(in);
    }

    /**
     * 下载网络文件
     * @param fileUrl 网络文件URL地址
     * @return 文件的二进制字节数组数据
     * @throws MalformedURLException
     */
    public static byte[] downloadNetworkFile(String fileUrl) throws MalformedURLException {
        URL ur = new URL(fileUrl);
        BufferedInputStream in = null;
        ByteArrayOutputStream out = null;
        try {
            //获取网络文件的输入流
            in = new BufferedInputStream(ur.openStream());
            out = new ByteArrayOutputStream(1024);
            byte[] temp = new byte[1024];
            int size = 0;
            while ((size = in.read(temp)) != -1) {
                out.write(temp, 0, size);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(in != null){
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(out != null){
            return out.toByteArray();
        }else{
            return null;
        }
    }

    /**
     * 将byte数组写入文件
     * @param path
     * @param content
     * @throws IOException
     */
    public static void saveFile(String path, byte[] content) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            File parentFile = file.getParentFile();
            if (!parentFile.exists()) {
                parentFile.mkdirs();
            }
            file.createNewFile();
        }
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(content);
        fos.close();
    }

    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    /**
     * 格式化路径.()
     * @param srcPath 原路径. /xxx/xxx/xxx.yyy 或 X:/xxx/xxx/xxx.yy
     *                /mydata/app1/uploadFilesManager/gacl/test/C5C5E1A94ECF4CA72A2B3566E8215022.jpg
     * @return list, 第一个是路径（/xxx/xxx/）,第二个是文件名（xxx.yy）
     */
    public static List<String> formatPath(final String srcPath) {
        List<String> list = new ArrayList<String>(2);
        String repSrc = srcPath.replaceAll("\\\\", "/");
        int firstP = repSrc.indexOf("/");
        int lastP = repSrc.lastIndexOf("/");
        String fileName = lastP + 1 == repSrc.length() ? "" : repSrc.substring(lastP + 1);
        String dir = firstP == -1 ? "" : repSrc.substring(firstP, lastP);
        dir = (dir.length() == 1 ? dir : (dir + "/"));
        list.add(dir);
        list.add(fileName);
        return list;
    }
}
