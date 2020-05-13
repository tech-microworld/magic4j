package com.itgacl.magic4j.libcommon.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * Spring Context 工具类
 *
 */
@Component
public class SpringContextUtils implements ApplicationContextAware {
	public static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringContextUtils.applicationContext = applicationContext;
	}

	/**
	 * 获取springbean
	 *
	 * @param beanName
	 * @param requiredType
	 * @param <T>
	 * @return
	 */
	public static <T> T getBean(String beanName, Class<T> requiredType) {
		if (containsBean(beanName)) {
			return applicationContext.getBean(beanName, requiredType);
		}
		return null;
	}

	/**
	 * 获取springbean
	 *
	 * @param requiredType
	 * @param <T>
	 * @return
	 */
	public static <T> T getBean(Class<T> requiredType) {
		return applicationContext.getBean(requiredType);
	}

	/**
	 * 获取springbean
	 *
	 * @param beanName
	 * @param <T>
	 * @return
	 */
	public static <T> T getBean(String beanName) {
		if (containsBean(beanName)) {
			Class<T> type = getType(beanName);
			return applicationContext.getBean(beanName, type);
		}
		return null;
	}

	/**
	 * ApplicationContext是否包含该Bean
	 *
	 * @param name
	 * @return
	 */
	public static boolean containsBean(String name) {
		return applicationContext.containsBean(name);
	}

	/**
	 * ApplicationContext该Bean是否为单例
	 *
	 * @param name
	 * @return
	 */
	public static boolean isSingleton(String name) {
		return applicationContext.isSingleton(name);
	}

	/**
	 * 获取该Bean的Class
	 *
	 * @param name
	 * @return
	 */
	public static <T> Class<T> getType(String name) {
		return (Class<T>) applicationContext.getType(name);
	}

	/**
	 * 依赖spring框架获取HttpServletRequest
	 *
	 * @return HttpServletRequest
	 */
	public static HttpServletRequest getRequest() {
		HttpServletRequest request = null;
		try {
			ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
			if (Objects.nonNull(requestAttributes)) {
				request = requestAttributes.getRequest();
			}
		} catch (Exception ignored) {
		}
		return request;
	}

}