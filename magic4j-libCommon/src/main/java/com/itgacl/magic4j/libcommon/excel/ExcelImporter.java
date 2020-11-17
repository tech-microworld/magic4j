package com.itgacl.magic4j.libcommon.excel;

import java.util.List;

/**
 * Excel统一导入接口
 *
 */
public interface ExcelImporter<T> {

	/**
	 * 导入数据逻辑
	 *
	 * @param data 数据集合
	 */
	void save(List<T> data);

}
