package com.itgacl.magic4j.modules.sys.excel;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import com.itgacl.magic4j.libcommon.excel.LocalDateTimeConverter;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 用户导出Excel模板
 *
 */
@Data
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
public class UserExcel implements Serializable {
	private static final long serialVersionUID = 1L;

	@ColumnWidth(15)
	@ExcelProperty("用户编号")
	private Long id;

	@ColumnWidth(15)
	@ExcelProperty("用户名")
	private String username;

	@ColumnWidth(10)
	@ExcelProperty("姓名")
	private String realName;

	@ExcelProperty("邮箱")
	private String email;

	@ColumnWidth(15)
	@ExcelProperty("手机")
	private String cellphone;

	@ExcelIgnore
	@ExcelProperty("角色ID列表")
	private List<Long> roleIdList;

	@ExcelIgnore
	@ExcelProperty("部门ID")
	private Long deptId;

	@ExcelIgnore
	@ExcelProperty("岗位ID列表")
	private List<Long> postIdList;

	@ExcelProperty("角色名称")
	private String roleName;

	@ExcelProperty("部门名称")
	private String deptName;

	@ExcelProperty("岗位名称")
	private String postName;

	@ExcelProperty(value = "创建时间",converter = LocalDateTimeConverter.class)
	private LocalDateTime createTime;
}
