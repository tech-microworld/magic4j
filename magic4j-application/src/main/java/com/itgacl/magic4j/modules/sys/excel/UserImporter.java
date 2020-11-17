package com.itgacl.magic4j.modules.sys.excel;

import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.sys.service.SysUserService;
import lombok.RequiredArgsConstructor;

import java.util.List;

/**
 * 用户数据导入器
 */
@RequiredArgsConstructor
public class UserImporter implements ExcelImporter<UserExcel> {

	private final SysUserService sysUserService;
	private final Boolean isCovered;

	@Override
	public void save(List<UserExcel> data) {
		sysUserService.importUser(data, isCovered);
	}
}
