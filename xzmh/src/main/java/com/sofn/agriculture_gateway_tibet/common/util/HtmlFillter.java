package com.sofn.agriculture_gateway_tibet.common.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HtmlFillter implements Filter{
    
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest re=(HttpServletRequest)request; 
		HttpServletResponse res=(HttpServletResponse) response;
		String url = re.getServletPath();

		url=url.replaceAll(".html", "");
		
		re.getRequestDispatcher(url).forward(re, res);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
