package com.itgacl.magic4j.libcommon.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * 响应结果类
 */
@ApiModel("响应结果")
public class R<T> implements Serializable {

	private static final long serialVersionUID = 6775422262797117144L;

	private static final Integer CODE_SUCCESS = 0;
	private static final int CODE_FAIL = 1;
	public static final int CODE_UNAUTHORIZED = 2;//未登录

	private static final String SUCCESS_MSG = "success";
	private static final String FAIL_MSG = "fail";

	@ApiModelProperty("响应状态码，0表示成功，其他表示失败")
	private Integer code;

	@ApiModelProperty("响应信息")
	private String msg;

	@ApiModelProperty("响应数据")
	private T data;

	public R(){
		this.code = CODE_SUCCESS;
		this.msg = SUCCESS_MSG;
	}

	public R(String msg){
		this.code = CODE_SUCCESS;
		this.msg = msg;
	}

	public R(T data){
		this.code = CODE_SUCCESS;
		this.msg = SUCCESS_MSG;
		this.data = data;
	}

	
	public R(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public R(int code, String msg, T data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public R(Throwable e) {
		super();
		this.msg = e.getMessage();
		this.code = 1;
	}

	public Integer getCode() {
		return this.code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return (T) this.data;
	}

	public void setData(T data) {
		this.data = data;
	}

	/**
	 * 生成一个成功的{@linkplain R}对象
	 *
	 * @param data
	 * @param <T>
	 * @return
	 */
	public static <T> R<T> ok(T data) {
		return new R<>(data);
	}

	public static <T> R<T> success(String msg) {
		return new R<>(msg);
	}

	public static  <T> R<T> ok(){
		return new R<>();
	}

	public static <T> R<T> fail(){
		return new R<>(CODE_FAIL,FAIL_MSG);
	}

	public static <T> R<T> fail(String msg){
		return new R<>(CODE_FAIL,msg);
	}

	public static <T> R<T> fail(Integer code, String msg){
		return new R<>(code,msg);
	}

	public static <T> R<T> fail(Throwable e){
		return new R<>(e);
	}
}
