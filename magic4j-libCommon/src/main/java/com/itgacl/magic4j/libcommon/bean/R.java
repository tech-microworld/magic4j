package com.itgacl.magic4j.libcommon.bean;

import java.io.Serializable;

/**
 * 返回给客户端的响应数据
 */
public class R implements Serializable {

    private static final long serialVersionUID = -4577255781088498763L;

    private static final int CODE_OK = 0;
    private static final int CODE_FAIL = 1;
    public static final int CODE_UNAUTHORIZED = 2;

    private Object data = new Object(); //响应数据
    private int code = CODE_OK; //响应状态码
    private String msg = ""; //响应信息

    //APIS
    public static R ok(){
        return new R().code(CODE_OK);
    }

    public static R ok(Object data){
        return new R().code(CODE_OK).data(data);
    }

    public static R fail(){
        return new R().code(CODE_FAIL);
    }
    public static R fail(String msg){
        return new R().code(CODE_FAIL).msg(msg);
    }

    public static R fail(int code,String msg){
        return new R().code(code).msg(msg);
    }

    public static R fail(Throwable e){
        return fail().msg(e);
    }

    public R msg(Throwable e){
        this.setMsg(e.toString());
        return this;
    }

    public R msg(String msg){
        this.setMsg(msg);
        return this;
    }

    public R data(Object data){
        this.setData(data);
        return this;
    }
    public R code(int code){
       this.setCode(code);
        return this;
    }

    public R(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    //Constructors
    public R() {

    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    //Getter&Setters
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data == null ? new Object() : data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
