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

import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;

import oracle.net.jdbc.nl.NVNavigator;

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
		PageInfo<NavigationTitle> pageBean = titleService.AllTitlesPaging(start,length,param);
		
		
		info.put("aaData", pageBean.getList());
		//页数信息配置
		info.put("sEcho", sEcho);
		info.put("iTotalRecords", pageBean.getTotal());
		info.put("iTotalDisplayRecords",pageBean.getTotal());
		return info;
	}
	
	
	
	/**
	 * 标题检测，是否存在
	 */
	@RequestMapping("/titleNameCheck")
	@ResponseBody
	public Object TitleNameCheck(@RequestParam("tCode") String tCode , String tId) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		
		Map<String ,String> param = new HashMap<String, String>();
		param.put("tCode", tCode);
		List<NavigationTitle> list = titleService.AllTitles(param);
		if(list == null || (list != null && list.size() == 0) || (list != null && list.size() > 0 && list.get(0).gettId().equals(tId))   ) {
			retVal.put("valid", true );
			retVal.put("message", "导航编码可用");
		}else {
			retVal.put("valid", false );
			retVal.put("message", "导航编码已存在");
		}
		return retVal;
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
	 *标题的增加或修改
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Object AddTitle( NavigationTitle title) {
			Map<String ,Object> retVal = new HashMap<String, Object>();
			
			if(title!= null && title.checkMustNeed()) {
				if(title.gettId() != null && !title.gettId().equals("")) {
					int num = titleService.updateTitle(title);
					if(num > 0) {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
						retVal.put(RETURN_MESS, CHANGE_SUCCESS_MESS );
					}else {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
						retVal.put(RETURN_MESS, CHANGE_FAILED_MESS );
					}
				}else {
					int num = titleService.addTitle(title);
					if(num > 0) {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
						retVal.put(RETURN_MESS, ADD_SUCCESS_MESS );
					}else {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
						retVal.put(RETURN_MESS, ADD_FAILED_MESS );
					}
				}
			}
			return retVal;
	}
	
	/**
	 *标题的启用或停用
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Object UpdateTitle(@RequestParam(name="tId" , required = true) String tId,
			@RequestParam(name="tEnableState" , required = true) int tEnableState) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		NavigationTitle title = new NavigationTitle();
		title.settId(tId);
		title.settEnableState(tEnableState);
		int num = titleService.updateTitle(title);
		if(num > 0 ) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, CHANGE_SUCCESS_MESS );
		}else {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
			retVal.put(RETURN_MESS, CHANGE_FAILED_MESS );
		}
		
		return retVal;
	}
	

	/**
	 *标题删除
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/del")
	@ResponseBody
	public Object deleteTitle(@RequestParam(name="tId" , required = true) String tId) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		int num = titleService.deleteTitle(tId);
		if(num > 0 ) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, DEL_SUCCESS_MESS);
		}else {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
			retVal.put(RETURN_MESS, DEL_FAILED_MESS );
		}
		
		return retVal;
	}	

	
	
	
}
