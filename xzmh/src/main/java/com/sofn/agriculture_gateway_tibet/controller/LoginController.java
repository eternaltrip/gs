package com.sofn.agriculture_gateway_tibet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sofn.agriculture_gateway_tibet.common.util.Md5encyptUtil;
import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;
import com.sofn.agriculture_gateway_tibet.entity.SysComAdmin;
import com.sofn.agriculture_gateway_tibet.service.SysUserService;


/**
 * 
 * 登录类
 * @author yangjin
 *
 */
@Controller
@RequestMapping("/account")
public class LoginController  extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 登录
	 * @param account 账户	
	 * @param passwd 密码
	 * @return
	 */
	@RequestMapping("/sysLogin")
	@ResponseBody
	public Object sysLogin(@RequestParam(name="account" ,required=true) String account,
							@RequestParam(name="passwd" ,required=true)String passwd,
							HttpServletRequest request ) {
		
		Map<String , String> retVal = new HashMap<String , String>();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, LOGIN_FAILED_MESS);
		
		try {
			SysComAdmin admin = sysUserService.sysLogin(account, passwd);
			
			if(admin != null) {
				request.getSession().setAttribute(USERCONTENT, admin);
				retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
				retVal.put(RETURN_MESS, LOGIN_SUCCESS_MESS);
			}
		} catch (Exception e) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.exception.name());
			retVal.put(RETURN_MESS, SYS_EXCEPTION_MESS);
			e.printStackTrace();
		}
		return retVal;
	}
	
	/**
	 * 修改密码
	 * @param oldpasswd 旧密码
	 * @param newpasswd 新密码
	 * @return
	 */
	@RequestMapping("/changePW")
	@ResponseBody
	public Object changePasswd( @RequestParam(name="oldpasswd" ,required=true)String oldpasswd,
								@RequestParam(name="newpasswd" ,required=true)String newpasswd,
							HttpServletRequest request ) {
		Map<String , String> retVal = new HashMap<String , String>();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, CHANGEPW_FAILED_MESS);
		
		SysComAdmin admin = (SysComAdmin) request.getSession().getAttribute(USERCONTENT);
		
		try {
			//输入的原密码与用户密码一致，才进行修改
			if(Md5encyptUtil.validPassword( oldpasswd , admin.getUserPwd() ) ){
				if(sysUserService.changePasswd(admin.getId(), newpasswd)) {
					retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
					retVal.put(RETURN_MESS, CHANGEPW_SUCCESS_MESS);
				}
			}else {
				retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
				retVal.put(RETURN_MESS, CHANGEPW_FAILED_OLDPW_WRONG_MESS);
			}
		} catch (Exception e) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.exception.name());
			retVal.put(RETURN_MESS, SYS_EXCEPTION_MESS);
			e.printStackTrace();
		}
		return retVal;
	}
	
	/**
	 * 到登录页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public Object login(HttpServletRequest request) {
		
		request.getSession().removeAttribute(USERCONTENT);
		
		return new ModelAndView("sysmanage/login");
	}
	
	
	
	
}
