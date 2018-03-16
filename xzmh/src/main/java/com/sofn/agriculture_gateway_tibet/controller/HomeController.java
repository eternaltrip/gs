package com.sofn.agriculture_gateway_tibet.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.entity.Article;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.entity.OtherLink;
import com.sofn.agriculture_gateway_tibet.service.ArticleService;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;
import com.sofn.agriculture_gateway_tibet.service.OtherLinkService;
/**
 * 程序启动首页--门户页面
 * @author Administrator
 *
 */

@Controller
public class HomeController {

	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private NavigationTitleService titleService;
	
	@Autowired
	private OtherLinkService otherLinkService;
	

	@ModelAttribute("titles")
	public List<NavigationTitle> init() {
		
		//查询所有有效导航
		Map<String , Object> titleParam = new HashMap();
		titleParam.put("tEnableState", 1);
		List<NavigationTitle> titles = titleService.AllTitles(titleParam);
		return titles;
	}
	
	
	@ModelAttribute("links")
	public List<OtherLink>  init2() {
		
		//查询所有有效导航
		Map<String , Object> titleParam = new HashMap();
		titleParam.put("linkstate", 1);
		List<OtherLink> links = otherLinkService.selectAll(titleParam);
		return links;
	}
	
	
	
	
	
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping()
	public Object homePage(@ModelAttribute("titles") List<NavigationTitle> titles
							) {
		ModelAndView modelAndView = new ModelAndView("homepage/home");
		
		//从model中获取导航信息
		
		//查询所有有效头条
		Article article = new Article();
		article.setaEnableState(1);
		article.setaEnableHeadline(1);
		List<Article> tops = articleService.selectArticle(article);
		
		//查询排列第一个导航的12条
		article = new Article();
		article.setTitleId(titles.get(1).gettId());
		article.setaEnableState(1);
		PageInfo<Article> page_1_12 = articleService.selectArticle(article , 0 , 12);
		
		//查询排列第二个导航的4条
		article = new Article();
		article.setTitleId(titles.get(2).gettId());
		article.setaEnableState(1);
		PageInfo<Article> page_2_4 = articleService.selectArticle(article , 0 , 4);
		
		
		//查询排列第三个导航的9条
		article = new Article();
		article.setTitleId(titles.get(3).gettId());
		article.setaEnableState(1);
		PageInfo<Article> page_3_9 = articleService.selectArticle(article , 0 , 9);
		
	//	modelAndView.addObject("titles", titles);
		modelAndView.addObject("tops", tops);
		modelAndView.addObject("page_1_12", page_1_12.getList());
		modelAndView.addObject("page_2_4", page_2_4.getList());
		modelAndView.addObject("page_3_9", page_3_9.getList());
		modelAndView.addObject("isindex", true);//主页标识
		return modelAndView;
	}
	
	/**
	 * 查询列表
	 * @param modelAndView
	 * @param tId
	 */
	@RequestMapping("/home/list")
	public Object queryList(@ModelAttribute("titles") List<NavigationTitle> titles,
			ModelAndView modelAndView, @RequestParam("tId") String tId,
			@RequestParam(name="start",defaultValue="0")Integer start) {
		modelAndView.setViewName("homepage/list");
		
		Article article = new Article();
		article.setaEnableState(1);
		article.setTitleId(tId);
		PageInfo<Article> page_15 = articleService.selectArticle(article, start, 15);
		modelAndView.addObject("pageinfo", page_15);
		
		
		for (NavigationTitle navigationTitle : titles) {
			if(tId.equals(navigationTitle.gettId())) {
				modelAndView.addObject("title", navigationTitle);
			}
		}
		modelAndView.addObject("islist", true);//列表页面标识
		return modelAndView;
	}
	
	

	
	
	
	/**
	 * 查询详情
	 * @param modelAndView
	 * @param dId
	 * @return
	 */
	@RequestMapping("/home/details")
	public Object getDetails(@ModelAttribute("titles") List<NavigationTitle> titles,
			@ModelAttribute("links") List<OtherLink> links,
			ModelAndView modelAndView, @RequestParam("aId") String aId) {
		modelAndView.setViewName("homepage/detailinfo");
		//先查详情
		Article article = new Article();
		article.setaId(aId);
		List<Article> articles = articleService.selectArticle(article);
		
		if(articles!= null && articles.size() > 0) {
			modelAndView.addObject("info", articles.get(0));
			
			
			for (NavigationTitle navigationTitle : titles) {
				if(articles.get(0).getTitleId().equals(navigationTitle.gettId())) {
					modelAndView.addObject("title", navigationTitle);
				}
			}
			
			//再查当前导航下的8个最新新闻
			article = new Article();
			article.setaEnableState(1);
			article.setTitleId(articles.get(0).getTitleId());
			PageInfo<Article> page_8 = articleService.selectArticle(article, 0, 8);
			
			modelAndView.addObject("relates", page_8.getList());
			modelAndView.addObject("isdetails",true);//详情页面标识
		}
		return modelAndView;
	}
	
	
	
}
