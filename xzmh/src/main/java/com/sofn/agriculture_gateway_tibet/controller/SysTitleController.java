package com.sofn.agriculture_gateway_tibet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.entity.PageBean;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;

/**
 * 系统导航标题管理。
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/title")
public class SysTitleController  extends BaseController {

	@Autowired
	private NavigationTitleService titleService;
	
	
	/**
	 * 所有标题
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping
	public Object AllTitles( ModelAndView modelAndView , HttpServletRequest request) {
		modelAndView.addObject("mess", "导航标题管理");
		modelAndView.setViewName("sysmanage/titlemanage");
		
		List<NavigationTitle> list = titleService.AllTitles(null);
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	

	/**
	 * 所有标题--分页查询
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/titlePaging")
	@ResponseBody
	public Object AllTitlesPaging(
			@RequestParam(value = "sEcho",required = false)Integer sEcho, 
			@RequestParam("start")Integer start,
			@RequestParam("length")Integer length) {
		Map<String, Object> info = new HashMap<String, Object>();
		
		
		Map<String,Object> param = new HashMap<String,Object>();
		PageBean<NavigationTitle> pageBean = titleService.AllTitlesPaging(start,length,param);
		
		
		info.put("aaData", pageBean.getList());
		//页数信息配置
		info.put("sEcho", sEcho);
		info.put("iTotalRecords", pageBean.getTotal());
		info.put("iTotalDisplayRecords",pageBean.getTotal());
		return info;
	}
	
	
	/**
	 * 标题详情
	 */
	@RequestMapping("/info")
	@ResponseBody
	public Object TitleInfo(@RequestParam("tid") String tid) {
		
		Map<String ,String> param = new HashMap<String, String>();
		param.put("tId", tid);
		List<NavigationTitle> list = titleService.AllTitles(param);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 *标题的增加
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public Object AddTitle( NavigationTitle title) {
		
		return titleService.addTitle(title);
	}
	
	/**
	 *标题的修改
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public Object UpdateTitle(@RequestParam(name="title" , required = true) NavigationTitle title) {
		
		return  titleService.updateTitle(title);
	}
	

	/**
	 *标题删除
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("del")
	@ResponseBody
	public Object deleteTitle(@RequestParam(name="tid" , required = true) String tid) {
		
		return titleService.deleteTitle(tid);
	}	

	
	
	
}
