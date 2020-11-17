package com.itgacl.magic4j.modules.sys.excel;

import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.sys.service.SysPostService;
import lombok.RequiredArgsConstructor;

import java.util.List;

/**
 * 岗位数据导入器
 */
@RequiredArgsConstructor
public class PostImporter implements ExcelImporter<PostExcel> {

	private final SysPostService postService;
	private final Boolean isCovered;

	@Override
	public void save(List<PostExcel> data) {
		postService.importPost(data, isCovered);
	}
}
