package com.itgacl.magic4j.libcommon.excel;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.thread.ThreadUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.excel.util.DateUtils;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.libcommon.util.FileUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.Charsets;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * 针对easyexcel封装的Excel工具类
 * easyexcel官方文档：https://www.yuque.com/easyexcel/doc/easyexcel
 */
@Slf4j
public class ExcelUtil {

	/**
	 * 读取excel的所有sheet数据
	 *
	 * @param excel excel文件
	 * @return List<Object>
	 */
	public static <T> List<T> read(MultipartFile excel, Class<T> clazz) {
		DataListener<T> dataListener = new DataListener<>();
		ExcelReaderBuilder builder = getReaderBuilder(excel, dataListener, clazz);
		if (builder == null) {
			return null;
		}
		builder.doReadAll();
		return dataListener.getDataList();
	}

	/**
	 * 读取excel的指定sheet数据
	 *
	 * @param excel   excel文件
	 * @param sheetNo sheet序号(从0开始)
	 * @return List<Object>
	 */
	public static <T> List<T> read(MultipartFile excel, int sheetNo, Class<T> clazz) {
		return read(excel, sheetNo, 1, clazz);
	}

	/**
	 * 读取excel的指定sheet数据
	 *
	 * @param excel         excel文件
	 * @param sheetNo       sheet序号(从0开始)
	 * @param headRowNumber 表头行数
	 * @return List<Object>
	 */
	public static <T> List<T> read(MultipartFile excel, int sheetNo, int headRowNumber, Class<T> clazz) {
		DataListener<T> dataListener = new DataListener<>();
		ExcelReaderBuilder builder = getReaderBuilder(excel, dataListener, clazz);
		if (builder == null) {
			return null;
		}
		builder.sheet(sheetNo).headRowNumber(headRowNumber).doRead();
		return dataListener.getDataList();
	}

	/**
	 * 读取并导入数据
	 *
	 * @param excel    excel文件
	 * @param importer 导入逻辑类
	 * @param <T>      泛型
	 */
	public static <T> void save(MultipartFile excel, ExcelImporter<T> importer, Class<T> clazz) {
		ImportListener<T> importListener = new ImportListener<>(importer);
		ExcelReaderBuilder builder = getReaderBuilder(excel, importListener, clazz);
		if (builder != null) {
			//注册时间转换器，解决：ExcelDataConvertException: Converter not found, convert STRING to java.time.LocalDateTime
			builder.registerConverter(new LocalDateTimeConverter());
			builder.doReadAll();
		}
	}

	/**
	 * 导出excel
	 *
	 * @param response 响应类
	 * @param dataList 数据列表
	 * @param clazz    class类
	 * @param <T>      泛型
	 */
	@SneakyThrows
	public static <T> void export(HttpServletResponse response, List<T> dataList, Class<T> clazz) {
		export(response, DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14), "导出数据", dataList, clazz);
	}

	/**
	 * 导出excel
	 *
	 * @param response  响应类
	 * @param fileName  文件名
	 * @param sheetName sheet名
	 * @param dataList  数据列表
	 * @param clazz     class类
	 * @param <T>       泛型
	 */
	@SneakyThrows
	public static <T> void export(HttpServletResponse response, String fileName, String sheetName, List<T> dataList, Class<T> clazz) {
		export(response,fileName,sheetName,dataList,clazz,null);
	}

	/**
	 * 导出excel
	 *
	 * @param response  响应类
	 * @param fileName  文件名
	 * @param sheetName sheet名
	 * @param dataList  数据列表
	 * @param clazz     class类
	 * @param includeColumnFiledNames     需要导出的列名称集合
	 * @param <T>       泛型
	 */
	@SneakyThrows
	public static <T> void export(HttpServletResponse response, String fileName, String sheetName, List<T> dataList, Class<T> clazz,List<String> includeColumnFiledNames) {
		response.setContentType("application/vnd.ms-excel");
		response.setCharacterEncoding(Charsets.UTF_8.name());
		fileName = URLEncoder.encode(fileName, Charsets.UTF_8.name());
		response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
		if(CollectionUtil.isNotEmpty(includeColumnFiledNames)){
			EasyExcel.write(response.getOutputStream(), clazz).registerConverter(new LocalDateTimeConverter()).includeColumnFiledNames(includeColumnFiledNames).sheet(sheetName).doWrite(dataList);
		}else {
			EasyExcel.write(response.getOutputStream(), clazz).registerConverter(new LocalDateTimeConverter()).sheet(sheetName).doWrite(dataList);
		}
	}

	/**
	 * 导出并上传到文件服务器
	 * @param fileName
	 * @param sheetName
	 * @param dataList
	 * @param clazz
	 * @param <T>
	 * @return
	 */
	@SneakyThrows
	public static <T> UploadResult exportAndUpload(String fileName, String sheetName, List<T> dataList, Class<T> clazz) {
		return exportAndUpload(fileName,sheetName,dataList,clazz,null);
	}

	/**
	 * 导出并上传到文件服务器
	 * @param fileName
	 * @param sheetName
	 * @param dataList
	 * @param clazz
	 * @param includeColumnFiledNames     需要导出的列名称集合
	 * @param <T>
	 * @return
	 */
	@SneakyThrows
	public static <T> UploadResult exportAndUpload(String fileName, String sheetName, List<T> dataList, Class<T> clazz,List<String> includeColumnFiledNames) {
		String exportFileSavePath = export(fileName, sheetName, dataList, clazz, includeColumnFiledNames);
		log.debug("exportFileSavePath:{}",exportFileSavePath);
		//上传到文件服务器
		UploadResult uploadResult = StorageFactory.build().uploadFile(exportFileSavePath);
		ThreadUtil.execute(() -> {
			//删除本地文件
			boolean deleteResult = FileUtil.delete(exportFileSavePath);
			if(!deleteResult){
				log.warn("删除本地文件：{}失败",exportFileSavePath);
			}
		});
		return uploadResult;
	}

	/**
	 * 导出
	 * @param fileName
	 * @param sheetName
	 * @param dataList
	 * @param clazz
	 * @param includeColumnFiledNames     需要导出的列名称集合
	 * @param <T>
	 * @return
	 */
	@SneakyThrows
	public static <T> String export(String fileName, String sheetName, List<T> dataList, Class<T> clazz,List<String> includeColumnFiledNames) {
		String fileSavePath = FileUtil.getPath() + fileName + ".xlsx";//本地保存的文件
		if(CollectionUtil.isNotEmpty(includeColumnFiledNames)){
			EasyExcel.write(fileSavePath, clazz).registerConverter(new LocalDateTimeConverter()).includeColumnFiledNames(includeColumnFiledNames).sheet(sheetName).doWrite(dataList);
		}else {
			EasyExcel.write(fileSavePath, clazz).registerConverter(new LocalDateTimeConverter()).sheet(sheetName).doWrite(dataList);
		}
		//文件的本地服务器存储路径
		return fileSavePath;
	}

	/**
	 * 导出excel
	 *
	 * @param response  响应类
	 * @param fileName  文件名
	 * @param sheetName sheet名
	 * @param dataList  数据列表
	 * @param clazz     class类
	 * @param excludeColumnNames     不需要需要导出的列名称集合
	 * @param <T>       泛型
	 */
	@SneakyThrows
	public static <T> void exportWithExcludeColumnNames(HttpServletResponse response, String fileName, String sheetName, List<T> dataList, Class<T> clazz,List<String> excludeColumnNames) {
		response.setContentType("application/vnd.ms-excel");
		response.setCharacterEncoding(Charsets.UTF_8.name());
		fileName = URLEncoder.encode(fileName, Charsets.UTF_8.name());
		response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
		if(CollectionUtil.isNotEmpty(excludeColumnNames)){
			EasyExcel.write(response.getOutputStream(), clazz).registerConverter(new LocalDateTimeConverter()).excludeColumnFiledNames(excludeColumnNames).sheet(sheetName).doWrite(dataList);
		}else {
			EasyExcel.write(response.getOutputStream(), clazz).registerConverter(new LocalDateTimeConverter()).sheet(sheetName).doWrite(dataList);
		}
	}

	/**
	 * 获取构建类
	 *
	 * @param excel        excel文件
	 * @param readListener excel监听类
	 * @return ExcelReaderBuilder
	 */
	public static <T> ExcelReaderBuilder getReaderBuilder(MultipartFile excel, ReadListener<T> readListener, Class<T> clazz) {
		String filename = excel.getOriginalFilename();
		if (StringUtils.isEmpty(filename)) {
			throw new Magic4jException("请上传文件!");
		}
		if ((!StringUtils.endsWithIgnoreCase(filename, ".xls") && !StringUtils.endsWithIgnoreCase(filename, ".xlsx"))) {
			throw new Magic4jException("请上传正确的excel文件!");
		}
		InputStream inputStream;
		try {
			inputStream = new BufferedInputStream(excel.getInputStream());
			return EasyExcel.read(inputStream, clazz, readListener);
		} catch (IOException e) {
			log.error(e.getMessage(),e);
		}
		return null;
	}
}
