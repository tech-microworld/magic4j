package com.itgacl.magic4j;

import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.itgacl.magic4j.common.config.MvcCorsProperties;
import com.itgacl.magic4j.libcommon.filter.RequestDecryptFilter;
import com.itgacl.magic4j.libcommon.util.RemotingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import java.util.ArrayList;
import java.util.List;

/**
 * 注：为了避免扫描路径不一致，将启动类放在Root Package 即 com.itgacl
 */
@EnableTransactionManagement// 启注解事务管理，等同于xml配置方式的 <tx:annotation-driven />
@SpringBootApplication
public class Magic4jApplication {

	//文件上传临时存放目录
	@Value("${magic4j.fileUpload.tempSavePath}")
	private String tempSavePath;

	@Bean//使用@Bean注入fastJsonHttpMessageConvert
	public HttpMessageConverters fastJsonHttpMessageConverters(){
		//1.需要定义一个Convert转换消息的对象
		FastJsonHttpMessageConverter fastConverter=new FastJsonHttpMessageConverter();
		//2.添加fastjson的配置信息，比如是否要格式化返回的json数据
		FastJsonConfig fastJsonConfig=new FastJsonConfig();
		fastJsonConfig.setSerializerFeatures(
				SerializerFeature.PrettyFormat,
				SerializerFeature.WriteNullStringAsEmpty,//字符类型字段如果为null,输出为"",而非null
				SerializerFeature.WriteNullListAsEmpty,//List字段如果为null,输出为[],而非null
				SerializerFeature.DisableCircularReferenceDetect //避免循环引用
		);
		fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm:ss");
		//3.在convert中添加配置信息
		fastConverter.setFastJsonConfig(fastJsonConfig);

		//处理中文乱码问题(不然出现中文乱码)
		List<MediaType> fastMediaTypes = new ArrayList<MediaType>();
		fastMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
		fastConverter.setSupportedMediaTypes(fastMediaTypes);

		HttpMessageConverter<?> converter=fastConverter;
		return new HttpMessageConverters(converter);
	}


	/**
	 * 文件上传临时路径
	 */
	@Bean
	MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		//设置一个临时目录，解决：java.io.IOException: The temporary upload location [/tmp/tomcat.3541620039171925702.8092/work/Tomcat/localhost/ROOT] is not valid问题
		if(RemotingUtil.isLinuxPlatform()){//如果是Linux平台
			if(!FileUtil.exist(tempSavePath)){
				FileUtil.mkdir(tempSavePath);
			}
			factory.setLocation(tempSavePath);
		}
		return factory.createMultipartConfig();
	}

	/**
	 * 创建一个bean
	 * @return
	 */
	@Bean
	public Filter requestDecryptFilter() {
		return new RequestDecryptFilter();
	}

	/**
	 * C0RS跨域过滤器
	 * @param mvcCorsProperties
	 * @return
	 */
	@Bean
	@ConditionalOnMissingBean(CorsFilter.class)
	public CorsFilter corsFilter(@Autowired MvcCorsProperties mvcCorsProperties) {
		if (mvcCorsProperties.getMappings().size() == 0) {
			return new CorsFilter(new UrlBasedCorsConfigurationSource());
		} else {
			UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
			source.setCorsConfigurations(mvcCorsProperties.getMappings());
			return new CorsFilter(source);
		}
	}

	public static void main(String[] args) {
		SpringApplication.run(Magic4jApplication.class, args);
	}

}
