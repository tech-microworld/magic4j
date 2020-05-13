package com.itgacl.magic4j.libcommon.exception;

import com.itgacl.magic4j.libcommon.bean.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.UnexpectedTypeException;


/**
 * 全局异常处理器
 *
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 处理自定义异常(Magic4jException)
	 */
	@ExceptionHandler(Magic4jException.class)
	public R handleMagic4jException(Magic4jException e){
		return R.fail(e.getCode(),e.getMsg());
	}

	/**
	 * 处理自定义DataValidationException异常
	 * @param ex
	 * @return
	 */
	@ExceptionHandler(DataValidationException.class)
	public R handleDataValidationException(DataValidationException ex) {
		return R.fail(ex.getMessage());
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public R handleDuplicateKeyException(DuplicateKeyException e){
		logger.error(e.getMessage(), e);
		return R.fail("数据库中已存在该记录");
	}

	/**
	 * 处理@Valid注解校验输入参数合法性失败后抛出的异常
	 * @param e
	 * @return
	 */
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public R handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
		String errMsg =  e.getBindingResult().getFieldError().getDefaultMessage();//取得@NotNull(message=“自定义异常”)里的message内容给前端显示
		return R.fail(errMsg);
	}

	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public R handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e){
		return R.fail("不支持"+e.getMethod()+"方式请求");
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public R handlerNoFoundException(NoHandlerFoundException e) {
		return R.fail("路径不存在，请检查路径是否正确");
	}

	@ExceptionHandler(UnexpectedTypeException.class)
	public R handleUnexpectedTypeException(UnexpectedTypeException e){
		return R.fail(e.getMessage());
	}

	@ExceptionHandler(Exception.class)
	public R handleException(Exception e){
		logger.error(e.getMessage(), e);
		return R.fail("非常抱歉，系统出现了错误！");
	}
}
