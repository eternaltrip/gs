package com.sofn.agriculture_gateway_tibet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 程序启动首页--门户页面
 * @author Administrator
 *
 */

@Controller
public class HomeController {

	
	
	@RequestMapping("/")
	public Object homePage() {
		ModelAndView modelAndView = new ModelAndView("homepage/home");
		System.out.println("home page");
		return modelAndView;
	}
}
