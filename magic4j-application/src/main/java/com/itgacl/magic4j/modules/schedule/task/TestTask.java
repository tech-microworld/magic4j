package com.itgacl.magic4j.modules.schedule.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 测试定时任务(演示Demo，可删除)
 * 
 * testTask为spring bean的名称
 *
 */
@Slf4j
@Component("testTask")
public class TestTask {

	//定时任务只能接受一个参数；如果有多个参数，使用json数据即可
	public void test1(String params){
		log.debug("我是带参数的test1方法，正在被执行，参数为：" + params);
	}

	public void test2(){
		log.debug("我是不带参数的test2方法，正在被执行");
	}
}
