package com.itgacl.magic4j.modules.sys.excel;

import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.sys.service.SysDictService;
import lombok.RequiredArgsConstructor;

import java.util.List;

/**
 * 字典数据导入器
 */
@RequiredArgsConstructor
public class DictImporter implements ExcelImporter<DictExcel> {

	private final SysDictService dictService;
	private final Boolean isCovered;

	@Override
	public void save(List<DictExcel> data) {
		dictService.importDict(data, isCovered);
	}
}
