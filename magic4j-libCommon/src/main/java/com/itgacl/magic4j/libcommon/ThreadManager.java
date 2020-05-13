package com.itgacl.magic4j.libcommon;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 线程管理器，管理线程池
 *
 *
 */
public class ThreadManager {

	private static final Logger logger = LoggerFactory.getLogger(ThreadManager.class);

	private ThreadManager() {

	}

	private static ThreadManager instance = new ThreadManager();
	private ThreadPoolProxy longPool;
	private ThreadPoolProxy shortPool;

	public static ThreadManager getInstance() {
		return instance;
	}

	// 联网比较耗时
	// 线程池创建的的线程数量=cpu的核数*2+1
	//比如单核的CPU开辟开辟1*2+1=3个线程效率最高
	public synchronized ThreadPoolProxy createLongPool() {
		if (longPool == null) {
			longPool = new ThreadPoolProxy(5, 5, 5000L);
		}
		return longPool;
	}

	// 操作本地文件
	public synchronized ThreadPoolProxy createShortPool() {
		if(shortPool==null){
			shortPool = new ThreadPoolProxy(3, 3, 5000L);
		}
		return shortPool;
	}

	/**
	 * 创建线程池的代理
	 */
	public class ThreadPoolProxy {
		private ThreadPoolExecutor pool;
		private int corePoolSize;
		private int maximumPoolSize;
		private long time;

		public ThreadPoolProxy(int corePoolSize, int maximumPoolSize, long time) {
			this.corePoolSize = corePoolSize;
			this.maximumPoolSize = maximumPoolSize;
			this.time = time;

		}

		/**
		 * 执行任务
		 * @param runnable
		 */
		public void execute(Runnable runnable) {
			if (pool == null) {
				// 创建线程池
				/*
				 * 1. 线程池里面管理多少个线程
				 * 2. 如果排队满了, 额外的开的线程数
				 * 3. 如果线程池没有要执行的任务 存活多久
				 * 4.时间的单位
				 * 5 如果 线程池里管理的线程都已经用了,剩下的任务 临时存到LinkedBlockingQueue对象中 排队
				 */
				pool = new ThreadPoolExecutor(corePoolSize, maximumPoolSize,
						time, TimeUnit.MILLISECONDS,
						new LinkedBlockingQueue<Runnable>(10));
			}
			pool.execute(runnable); // 调用线程池 执行异步任务
			logger.info("调用线程池执行异步任务");
		}

		/**
		 * 取消任务
		 * @param runnable
		 */
		public void cancel(Runnable runnable) {
			if (pool != null && !pool.isShutdown() && !pool.isTerminated()) {
				pool.remove(runnable); // 取消异步任务
			}
		}
	}
}
