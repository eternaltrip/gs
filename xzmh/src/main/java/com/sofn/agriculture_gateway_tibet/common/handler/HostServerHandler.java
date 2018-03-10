package com.sofn.agriculture_gateway_tibet.common.handler;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 获取主机头信息（避免页面上使用java注入的方式去获得path，因为那样会造成主机头攻击漏洞）
 * @author Administrator
 *
 */
@Configuration
public class HostServerHandler  {

	public static String hostPath = "";

	public static String hostPath() {
		if (hostPath.equals("")) {
			WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
			ServletContext servletContext = webApplicationContext.getServletContext();
			hostPath = servletContext.getContextPath();
		}
		return hostPath;
	}

}
