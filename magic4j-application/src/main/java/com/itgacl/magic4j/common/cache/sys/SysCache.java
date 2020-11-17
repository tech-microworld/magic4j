package com.itgacl.magic4j.common.cache.sys;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.util.ConversionUtil;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.modules.sys.entity.*;
import com.itgacl.magic4j.modules.sys.service.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * 系统缓存
 *
 */
public class SysCache {

	private static final String USER_ID = "sys:user:id:";
	private static final String USER_NAME = "sys:user:name:";
	private static final String DEPT_ID = "sys:dept:id:";
	private static final String DEPT_NAME = "sys:dept:name:";
	private static final String DEPT_NAMES_ID = "sys:deptNames:id:";
	private static final String POST_ID = "sys:post:id:";
	private static final String POST_NAME = "sys:post:name:";
	private static final String POST_NAMES_ID = "sys:postNames:id:";
	private static final String ROLE_ID = "sys:role:id:";
	private static final String ROLE_NAME = "sys:role:name:";
	private static final String ROLE_NAMES_ID = "sys:roleNames:id:";
	private static final String TENANT_ID = "sys:tenant:id:";
	private static final String DICT_ID = "sys:dict:id:";
	private static final String DICT_TYPE = "sys:dict:type:";
	private static final String DICT_VALUE = "sys:dict:value:";
	private static final String DICT_LIST = "sys:dict:list:";

	private static final CacheService cacheService;
	private static final SysUserService userService;
	private static final SysDeptService deptService;
	private static final SysPostService postService;
	private static final SysRoleService roleService;
	private static final SysTenantService tenantService;
	private static final SysDictService dictService;

	static {
		cacheService = SpringContextUtils.getBean(CacheService.class);
		userService = SpringContextUtils.getBean(SysUserService.class);
		deptService = SpringContextUtils.getBean(SysDeptService.class);
		postService = SpringContextUtils.getBean(SysPostService.class);
		roleService = SpringContextUtils.getBean(SysRoleService.class);
		tenantService = SpringContextUtils.getBean(SysTenantService.class);
		dictService = SpringContextUtils.getBean(SysDictService.class);
	}

	/**
	 * 获取用户
	 *
	 * @param userId 用户id
	 * @return
	 */
	public static SysUser getUser(Long userId) {
		return cacheService.get(USER_ID+ userId, () -> userService.getById(userId));
	}

	/**
	 * 获取用户
	 *
	 * @param userName 用户名
	 * @return
	 */
	public static SysUser getUser(String userName) {
		return cacheService.get(USER_NAME+ userName, () -> userService.getOne(new QueryWrapper<SysUser>().eq(SysUser.USERNAME,userName)));
	}

	/**
	 * 获取部门
	 *
	 * @param id 主键
	 * @return
	 */
	public static SysDept getDept(Long id) {
		return cacheService.get(DEPT_ID+ id, () -> deptService.getById(id));
	}

	/**
	 * 获取部门id列表
	 *
	 * @param deptNames 部门名
	 * @return
	 */
	public static List<Long> getDeptIds(String deptNames) {
		return cacheService.get(DEPT_NAME + deptNames, () -> {
			List<String> nameList = Arrays.asList(deptNames.split(","));
			List<SysDept> deptList = deptService.query().select(SysDept.ID).in(SysDept.DEPT_NAME, nameList).list();
			List<Long> deptIds = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(deptList)){
				deptList.forEach(item->{
					deptIds.add(item.getId());
				});
			}
			return deptIds;
		});
	}

	/**
	 * 获取部门名
	 *
	 * @param id 主键
	 * @return 部门名
	 */
	public static String getDeptName(Long id) {
		if (id != null) {
			SysDept dept = getDept(id);
			if(dept!=null){
				return dept.getDeptName();
			}
		}
		return "";
	}


	/**
	 * 获取部门名集合
	 *
	 * @param deptIds 主键集合
	 * @return 部门名
	 */
	public static List<String> getDeptNames(String deptIds) {
		return cacheService.get(DEPT_NAMES_ID+ deptIds, () -> {
			List<Long> idList = Arrays.asList(ConversionUtil.toLongArray(deptIds));
			List<SysDept> deptList = deptService.query().select(SysDept.DEPT_NAME).in(SysDept.ID, idList).list();
			List<String> deptNames = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(deptList)){
				deptList.forEach(item->{
					deptNames.add(item.getDeptName());
				});
			}
			return deptNames;
		});
	}


	/**
	 * 获取岗位
	 *
	 * @param id 主键
	 * @return
	 */
	public static SysPost getPost(Long id) {
		return cacheService.get(POST_ID+ id, () -> postService.getById(id));
	}

	/**
	 * 获取岗位id列表
	 *
	 * @param postNames 岗位名
	 * @return
	 */
	public static List<Long> getPostIds(String postNames) {
		return cacheService.get(POST_NAME + postNames, () -> {
			List<String> nameList = Arrays.asList(postNames.split(","));
			List<SysPost> deptList = postService.query().select(SysPost.ID).in(SysPost.POST_NAME, nameList).list();
			List<Long> postIds = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(deptList)){
				deptList.forEach(item->{
					postIds.add(item.getId());
				});
			}
			return postIds;
		});
	}

	/**
	 * 获取岗位名
	 *
	 * @param id 主键
	 * @return 岗位名
	 */
	public static String getPostName(Long id) {
		if (id != null) {
			SysPost post = getPost(id);
			if (post != null) {
				return post.getPostName();
			}
		}
		return "";
	}

	/**
	 * 获取岗位名集合
	 *
	 * @param postIds 主键集合
	 * @return 岗位名
	 */
	public static List<String> getPostNameList(String postIds) {
		return cacheService.get(POST_NAMES_ID+ postIds, () -> {
			List<Long> idList = Arrays.asList(ConversionUtil.toLongArray(postIds));
			List<SysPost> deptList = postService.query().select(SysPost.POST_NAME).in(SysPost.ID, idList).list();
			List<String> postNames = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(deptList)){
				deptList.forEach(item->{
					postNames.add(item.getPostName());
				});
			}
			return postNames;
		});
	}

	/**
	 * 获取岗位名集合
	 *
	 * @param postIds 主键集合
	 * @return 岗位名
	 */
	public static String getPostNames(String postIds) {
		List<String> postNameList = getPostNameList(postIds);
		return CollUtil.join(postNameList, ",");
	}

	/**
	 * 获取角色
	 *
	 * @param id 主键
	 * @return Role
	 */
	public static SysRole getRole(Long id) {
		return cacheService.get(ROLE_ID+ id, () -> roleService.getById(id));
	}

	/**
	 * 获取角色id列表
	 *
	 * @param roleNames 角色名
	 * @return
	 */
	public static List<Long> getRoleIds(String roleNames) {
		return cacheService.get(ROLE_NAME + roleNames, () -> {
			List<String> nameList = Arrays.asList(roleNames.split(","));
			List<SysRole> roleList = roleService.query().select(SysRole.ID).in(SysRole.ROLE_NAME, nameList).list();
			List<Long> roleIds = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(roleList)){
				roleList.forEach(item->{
					roleIds.add(item.getId());
				});
			}
			return roleIds;
		});
	}

	/**
	 * 获取角色名
	 *
	 * @param id 主键
	 * @return 角色名
	 */
	public static String getRoleName(Long id) {
		SysRole role = getRole(id);
		return role.getRoleName();
	}

	/**
	 * 获取角色名集合
	 *
	 * @param roleIds 主键集合
	 * @return 角色名
	 */
	public static List<String> getRoleNameList(String roleIds) {
		return cacheService.get(ROLE_NAMES_ID+ roleIds, () -> {
			List<Long> idList = Arrays.asList(ConversionUtil.toLongArray(roleIds));
			List<SysRole> roleList = roleService.query().select(SysRole.ROLE_NAME).in(SysRole.ID, idList).list();
			List<String> roleNames = new ArrayList<>();
			if(CollectionUtil.isNotEmpty(roleList)){
				roleList.forEach(item->{
					roleNames.add(item.getRoleName());
				});
			}
			return roleNames;
		});
	}

	/**
	 * 获取角色名
	 *
	 * @param roleIds 主键集合
	 * @return 角色名
	 */
	public static String getRoleNames(String roleIds) {
		List<String> roleNames = getRoleNameList(roleIds);
		return CollUtil.join(roleNames, ",");
	}

	/**
	 * 获取租户
	 *
	 * @param id 主键
	 * @return Tenant
	 */
	public static SysTenant getTenant(Long id) {
		return cacheService.get(TENANT_ID+id ,() -> tenantService.getById(id));
	}

	/**
	 * 获取字典实体
	 *
	 * @param id 主键
	 * @return Dict
	 */
	public static SysDict getDict(Long id) {
		return cacheService.get(DICT_ID + id, () -> dictService.getById(id));
	}

	/**
	 * 获取字典文本
	 *
	 * @param dictType 字典类型
	 * @param dictCode 字典编码
	 * @return String
	 */
	public static String getDictLabel(String dictType, String dictCode) {
		SysDict dict = getDict(dictType,dictCode);
		if (dict != null) {
			return dict.getDictLabel();
		} else {
			return null;
		}
	}

	/**
	 * 获取字典文本
	 *
	 * @param dictType 字典类型
	 * @param dictCode 字典编码
	 * @return String
	 */
	public static SysDict getDict(String dictType, String dictCode) {
		return cacheService.get(DICT_VALUE + dictType + "#" + dictCode, () -> dictService.getOne(new QueryWrapper<SysDict>().eq(SysDict.DICT_TYPE, dictType).eq(SysDict.DICT_CODE, dictCode)));
	}

	/**
	 * 获取字典编码
	 *
	 * @param dictType 字典类型
	 * @param dictLabel 字典文本
	 * @return String
	 */
	public static String getDictCode(String dictType, String dictLabel) {
		return cacheService.get(DICT_TYPE + dictType + "#" + dictLabel, () -> {
			SysDict dict = dictService.getOne(new QueryWrapper<SysDict>().eq(SysDict.DICT_TYPE, dictType).eq(SysDict.DICT_LABEL, dictLabel));
			if (dict != null) {
				return dict.getDictCode();
			} else {
				return null;
			}
		});
	}

	/**
	 * 获取字典集合
	 *
	 * @param dictType 字典类型
	 * @return List<SysDict>
	 */
	public static List<SysDict> getList(String dictType) {
		return cacheService.get(DICT_LIST+ dictType, () -> dictService.list(new QueryWrapper<SysDict>().eq(SysDict.DICT_TYPE,dictType)));
	}
}
