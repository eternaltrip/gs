package com.sofn.agriculture_gateway_tibet.controller;

import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;

/**
 * controller用到的一些信息
 * @author Administrator
 *
 */
public abstract class BaseController {
	
	/*全局用户缓存对象*/
	public static String USERCONTENT = "usercontent";
	
	public static String RETURN_STATE = "return_state";

	public static String RETURN_MESS = "return_mess";
	
	public static String SYS_EXCEPTION_MESS = "系统异常！";
	
	public static String LOGIN_SUCCESS_MESS = "登录成功！";
	
	public static String LOGIN_FAILED_MESS = "登录失败！";
	
	public static String IMGCODE_WRONG_MESS = "验证码错误！";
	
	public static String CHANGE_FAILED_MESS = "修改失败！";
	
	public static String CHANGE_SUCCESS_MESS = "修改成功！";
	
	public static String ADD_SUCCESS_MESS = "添加成功！";
	
	public static String ADD_FAILED_MESS = "添加失败！";
	
	public static String DEL_FAILED_MESS = "删除失败！";
	
	public static String DEL_SUCCESS_MESS = "删除成功！";
	
	public static String QUERY_FAILED_MESS = "查询失败！";
	
	public static String QUERY_SUCCESS_MESS = "查询成功！";
	
	
	public static String CHANGEPW_FAILED_OLDPW_WRONG_MESS = "旧密码输入有误！";
	
	public static String UPLOAD_PATH = "upload/file";
	
	public static String UPLOAD_SUCCESS = "上传成功";
	
	public static String UPLOAD_FAILED = "上传失败";
	
	
	
	enum RETURN_STATE_INFO{
		success , failed , exception
		
	}
	
}
