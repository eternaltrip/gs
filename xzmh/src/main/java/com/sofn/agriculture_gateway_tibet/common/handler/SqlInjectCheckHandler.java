package com.sofn.agriculture_gateway_tibet.common.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 防止sql注入的拦截器
 * @author Administrator
 *
 */
public class SqlInjectCheckHandler implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		Enumeration params = request.getParameterNames();
		String sql = "";
		while (params.hasMoreElements()) {
			// 得到参数名
			String name = params.nextElement().toString();
			// 得到参数对应值
			String[] value = request.getParameterValues(name);
			for (int i = 0; i < value.length; i++) {
				sql = sql + value[i];
			}
		}
		// System.out.println("============================SQL"+sql);
		// 有sql关键字，跳转到error.html
		if (sqlValidate(sql)) {
			throw new Exception("输入含有非法字符");
//			return true;
		} else {

			return true;
		}

	}

	// 效验是否含有sql注入
	protected static boolean sqlValidate(String str) {
		str = str.toLowerCase();// 统一转为小写
		String badStr = "'|and|exec|execute|insert|select|delete|update|count|drop|*|%|chr|mid|master|truncate|"
				+ "char|declare|sitename|net user|xp_cmdshell|;|or|-|+|,|like'|and|exec|execute|insert|create|drop|"
				+ "table|from|grant|use|group_concat|column_name|"
				+ "information_schema.columns|table_schema|union|where|select|delete|update|order|by|count|*|"
				+ "chr|mid|master|truncate|char|declare|or|;|-|--|+|,|like|//|/|%|#";// 过滤掉的sql关键字，可以手动添加
		String[] badStrs = badStr.split("\\|");
		for (int i = 0; i < badStrs.length; i++) {
			if (str.indexOf(badStrs[i]) >= 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 过滤字符串中的js脚本 解码：StringEscapeUtils.unescapeXml(escapedStr)
	 */
	private String escapeXSS(String str) {
		str = StringEscapeUtils.escapeXml(str);

		Pattern tmpPattern = Pattern.compile("[sS][cC][rR][iI][pP][tT]");
		Matcher tmpMatcher = tmpPattern.matcher(str);
		if (tmpMatcher.find()) {
			str = tmpMatcher.replaceAll(tmpMatcher.group(0) + "\\\\");
		}
		return str;
	}

}
