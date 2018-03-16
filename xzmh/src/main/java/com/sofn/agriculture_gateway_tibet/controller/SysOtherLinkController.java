package com.sofn.agriculture_gateway_tibet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.entity.OtherLink;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;
import com.sofn.agriculture_gateway_tibet.service.OtherLinkService;

import oracle.net.jdbc.nl.NVNavigator;

/**
 * 友情链接管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/link")
public class SysOtherLinkController  extends BaseController {

	@Autowired
	private OtherLinkService otherLinkService;
	
	
	/**
	 * 所有友情链接
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping
	public Object AllLinks( ModelAndView modelAndView , HttpServletRequest request) {
		modelAndView.addObject("mess", "友情链接管理");
		modelAndView.setViewName("sysmanage/linkmanage");
		
		List<OtherLink> list = otherLinkService.selectAll(null);
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	
	
	
	/**
	 * 友情链接详情
	 */
	@RequestMapping("/info")
	@ResponseBody
	public Object TitleInfo(@RequestParam("lId") String lId) {
		OtherLink info = otherLinkService.selectByPrimaryKey(lId);
		return info;
	}
	
	
	
	/**
	 *友情链接的增加或修改
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Object AddTitle( @ModelAttribute("link") OtherLink link) {
			Map<String ,Object> retVal = new HashMap<String, Object>();
			
			if(link!= null ) {
				if(link.getLid() != null && !link.getLid().isEmpty()) {
					int num = otherLinkService.updateByPrimaryKey(link);
					if(num > 0) {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
						retVal.put(RETURN_MESS, CHANGE_SUCCESS_MESS );
					}else {
						retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
						retVal.put(RETURN_MESS, CHANGE_FAILED_MESS );
					}
				}else {
					int num = otherLinkService.insert(link);
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
	 *友情链接的启用或停用
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Object UpdateTitle(@ModelAttribute("link") OtherLink link ) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		int num = otherLinkService.updateByPrimaryKeySelective(link);
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
	 *友情链接删除
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/del")
	@ResponseBody
	public Object deleteTitle(@RequestParam(name="lId" , required = true) String lId) {
		Map<String ,Object> retVal = new HashMap<String, Object>();
		
		int num = otherLinkService.deleteByPrimaryKey(lId);
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
