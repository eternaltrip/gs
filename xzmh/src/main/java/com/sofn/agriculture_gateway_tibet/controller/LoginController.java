package com.sofn.agriculture_gateway_tibet.controller;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sofn.agriculture_gateway_tibet.common.constant.Constants;
import com.sofn.agriculture_gateway_tibet.common.util.Md5encyptUtil;
import com.sofn.agriculture_gateway_tibet.common.util.ValidateCodeUtil;
import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
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
	 * 推出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/loginOut")
	public Object login(ModelAndView modelAndView ,HttpServletRequest request) {
		
		request.getSession().removeAttribute(USERCONTENT);
		
		return "redirect:/account";
	}
	
	/**
	 * 到登录页面
	 * @param request
	 * @return
	 */
	@RequestMapping()
	public Object loginpage(HttpServletRequest request) {
		
		request.getSession().removeAttribute(USERCONTENT);
		
		return new ModelAndView("sysmanage/login");
	}
	
	
	/**
	 * 登录
	 * @param account 账户	
	 * @param passwd 密码
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Object sysLogin(@RequestParam(name="account" ,required=true) String account,
							@RequestParam(name="passwd" ,required=true)String passwd,
							@RequestParam("imgcode") String imgcode,
							HttpServletRequest request ) {
		
		Map<String , String> retVal = new HashMap<String , String>();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, LOGIN_FAILED_MESS);
		
		try {
			String imgcode1 = (String) request.getSession().getAttribute(Constants.RANDOMCODE_KEY);
			if(imgcode.toUpperCase().equals(imgcode1.toUpperCase())) {
				SysComAdmin admin = sysUserService.sysLogin(account, passwd);
				
				if(admin != null) {
					request.getSession().setAttribute(USERCONTENT, admin);
					retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
					retVal.put(RETURN_MESS, LOGIN_SUCCESS_MESS);
				}else {
					
				}
			}else {
				retVal.put("imgcodecheck", "false");
				retVal.put(RETURN_MESS, IMGCODE_WRONG_MESS);
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
		retVal.put(RETURN_MESS, CHANGE_FAILED_MESS);
		
		SysComAdmin admin = (SysComAdmin) request.getSession().getAttribute(USERCONTENT);
		
		try {
			//输入的原密码与用户密码一致，才进行修改
			if(Md5encyptUtil.validPassword( oldpasswd , admin.getUserPwd() ) ){
				if(sysUserService.changePasswd(admin.getId(), newpasswd)) {
					retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
					retVal.put(RETURN_MESS, CHANGE_SUCCESS_MESS);
					
					//修改成功之后，移除session中登录对象，要求重新登录
					request.getSession().removeAttribute(USERCONTENT);
					
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
	
	
	
	//检测旧密码
	@RequestMapping("/checkOldPw")
	@ResponseBody
	public Object checkOldPw(@RequestParam(name="oldpasswd" ,required=true)String oldpasswd,
							HttpServletRequest request) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		SysComAdmin admin = (SysComAdmin) request.getSession().getAttribute(USERCONTENT);
		try {
			//输入的原密码与用户密码一致，才进行修改
			if(Md5encyptUtil.validPassword( oldpasswd , admin.getUserPwd() ) ){
				retVal.put("valid", true );
				retVal.put("message", "旧密码验证通过");
			}else {
				retVal.put("valid", false );
				retVal.put("message", "旧密码输入有误");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return retVal;
	}
	
	
	
	
	
	
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/img")
	@ResponseBody
	public void getImag(HttpServletRequest request ,HttpServletResponse response) {
		new ValidateCodeUtil().getRandcode(request , response);
	}
	

	
	
	
	
}
