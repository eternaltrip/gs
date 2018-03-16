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
import com.sofn.agriculture_gateway_tibet.entity.Article;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.service.ArticleService;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;

@Controller
@RequestMapping("/article")
public class SysArticleManageController extends BaseController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private NavigationTitleService titleService;
	
	/**
	 * 新闻资讯管理首页
	 * @param modelAndView
	 * @param request
	 * @return
	 */
	@RequestMapping
	public Object ArticlePage( ModelAndView modelAndView , HttpServletRequest request) {
		modelAndView.addObject("mess", "新闻资讯");
		modelAndView.setViewName("sysmanage/articleManage");
		
		List<NavigationTitle> titles = titleService.AllTitles(null);
		modelAndView.addObject("titles", titles);
		
		
		List<Article> list = articleService.selectArticle(null);
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	
	/**
	 * 新闻资讯管理--分页查询
	 * @param modelAndView
	 * @param request
	 * @return
	 */
	@RequestMapping("/query")
	@ResponseBody
	public Object ArticleQuery( Article article,HttpServletRequest request,
					@RequestParam(value = "sEcho",required = false)Integer sEcho,
					@RequestParam("start")Integer start,
					@RequestParam("length")Integer length) {
		
		Map<String,Object> retVal = new HashMap();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, QUERY_FAILED_MESS );
		String titleId = request.getParameter("titleId").trim();
		String aTitle = request.getParameter("aTitle").trim();
		String aEnableHeadline = request.getParameter("aEnableHeadline").trim();
		String aEnableState = request.getParameter("aEnableState").trim();
		String aEnableTop = request.getParameter("aEnableTop").trim();
		
		if(titleId!= null && !titleId.equals("-1")) {
			article.setTitleId(titleId);
		}
		if(aTitle!= null && !aTitle.equals("-1")) {
			article.setaTitle(aTitle);
		}
		if(aEnableHeadline!= null && !aEnableHeadline.equals("-1")) {
			article.setaEnableHeadline(Integer.parseInt(aEnableHeadline));
		}
		if(aEnableState!= null && !aEnableState.equals("-1")) {
			article.setaEnableState(Integer.parseInt(aEnableState));
		}
		if(aEnableTop!= null && !aEnableTop.equals("-1")) {
			article.setaEnableTop(Integer.parseInt(aEnableTop));
		}
		
		PageInfo<Article> page = articleService.selectArticle(article , start , length);
		
		if(page != null) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, QUERY_SUCCESS_MESS );
			
			retVal.put("sEcho", sEcho);
			retVal.put("iTotalRecords", page.getTotal());
			retVal.put("iTotalDisplayRecords", page.getTotal());
			retVal.put("data", page.getList());
		}
		
		return retVal;
	}
	
	
	
	
	/**
	 * 新闻资讯--新增页面
	 * 
	 * @param modelAndView 
	 * @param aId 修改内容时，会跳转到编辑页面。所以带一个id
	 * @return
	 */
	@RequestMapping("/newpage")
	public Object newArticlePage(ModelAndView modelAndView ,String aId ) {
		modelAndView.addObject("mess", "新增新闻资讯");
		modelAndView.setViewName("sysmanage/articleEdit");
		
		//查询出所有的导航标题
		List<NavigationTitle> titles = titleService.AllTitles(null);
		modelAndView.addObject("titles", titles);
		
		if(aId != null && !aId.isEmpty()) {
			
			Article article = new Article();
			article.setaId(aId);
			List<Article> retVals = articleService.selectArticle(article);
			if(retVals != null && retVals.size() > 0 ) {
				
				modelAndView.addObject("atricle", retVals.get(0));
			}
		}
		
		return modelAndView;
	}
	
	
	
	/**
	 * 新闻资讯--新增
	 * @return
	 */
	@RequestMapping("/new")
	@ResponseBody
	public Object newArticle( Article article) {
		Map<String,Object> retVal = new HashMap();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, ADD_FAILED_MESS );
		
		int num = articleService.Article_Add(article);
		if(num > 0) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, ADD_SUCCESS_MESS );
		}
		return retVal;
	}
	
	/**
	 * 新闻资讯--修改
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Object updateArticle(Article article) {
		Map<String,Object> retVal = new HashMap();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, CHANGE_FAILED_MESS );
		
		int num = articleService.Article_Update(article);
		if(num > 0) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, CHANGE_SUCCESS_MESS );
		}
		return retVal;
	}
	
	
	/**
	 * 新闻资讯--新增
	 * @return
	 */
	@RequestMapping("/del")
	@ResponseBody
	public Object delArticle(@RequestParam("id")String id) {
		Map<String,Object> retVal = new HashMap();
		retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
		retVal.put(RETURN_MESS, DEL_FAILED_MESS );
		
		int num = articleService.Article_Delete(id);
		if(num > 0) {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
			retVal.put(RETURN_MESS, DEL_SUCCESS_MESS );
		}
		return retVal;
	}
	
	
	
	
	
	
}
