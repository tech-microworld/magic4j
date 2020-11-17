package com.itgacl.magic4j.common.converter;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Entity、VO、DTO转换器
 *
 */
public abstract class BaseConverter<E,V,T> {

	/**
	 * 实体转换为vo
	 *
	 * @param entity 实体类
	 * @return V
	 */
	public abstract V vo(E entity);

	/**
	 * DTO转换为实体
	 *
	 * @param entityDto 实体类
	 * @return V
	 */
	public abstract E entity(T entityDto);

	/**
	 * 实体类集合包装
	 *
	 * @param list 实体类集合
	 * @return List<V>
	 */
	public List<V> listVO(List<E> list) {
		return list.stream().map(this::vo).collect(Collectors.toList());
	}

	/**
	 * 实体类集合包装
	 *
	 * @param list 实体类集合
	 * @return List<V>
	 */
	public List<E> listEntity(List<T> list) {
		return list.stream().map(this::entity).collect(Collectors.toList());
	}


	/**
	 * 分页实体类集合包装
	 *
	 * @param pages 分页对象
	 * @return IPage<V>
	 */
	public IPage<V> pageVO(IPage<E> pages) {
		List<V> records = listVO(pages.getRecords());
		IPage<V> pageVo = new Page<>(pages.getCurrent(), pages.getSize(), pages.getTotal());
		pageVo.setRecords(records);
		return pageVo;
	}

}
