package com.sofn.agriculture_gateway_tibet.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sofn.agriculture_gateway_tibet.service.SysUserService;


/**
 * 后台管理控制
 * @author Administrator
 *
 */

@Controller
@RequestMapping("/sys")
public class SysManageController extends BaseController {
	
	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 后台管理首页
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/main")
	public Object sysMainPage( ModelAndView modelAndView) {
		modelAndView.addObject("sys", "sys manage test info");
		modelAndView.setViewName("sysmanage/main");
		return modelAndView;
	}
	
	
	/**
	 * 导航标题管理
	 */

	
	
	
}
