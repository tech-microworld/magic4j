/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.itgacl.magic4j.modules.sys.entity.ext;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


/**
 * 部门管理
 *
 */
@Data
public class SysDeptExt extends SysDept {

	/**
	 * 上级部门名称
	 */
	@TableField(exist=false)
	private String parentDeptName;
	/**
	 * ztree属性
	 */
	@TableField(exist=false)
	private Boolean open;

	@TableField(exist=false)
	private List<?> list;


}
