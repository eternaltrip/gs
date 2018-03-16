package com.sofn.agriculture_gateway_tibet.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.common.util.UuidTool;
import com.sofn.agriculture_gateway_tibet.dao.ArticleDao;
import com.sofn.agriculture_gateway_tibet.entity.Article;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao ;
	
	
	@Override
	public int Article_Add(Article article) {
		if(article == null) {
			return 0;
		}
		
		article.setaId(new UuidTool().getUuid());
		article.setaEnableHeadline(0);
		article.setaEnableState(1);
		article.setaEnableTop(0);
		article.setaHeadlineSort(0);
		
		article.setCreateTime(new Date());
		article.setUpdateTime(new Date());
	
		return articleDao.Article_Add(article);
	}

	@Override
	public int Article_Delete(String ttid) {
		
		if(ttid ==null || ttid.equals("")) {
			return 0;
		}
		return articleDao.Article_Delete(ttid);
	}

	@Override
	public int Article_Update(Article article) {
		if(article ==null ) {
			return 0;
		}
		article.setUpdateTime(new Date());
		return articleDao.Article_Update(article);
	}

	@Override
	public List<Article> selectArticle(Article article) {
		return articleDao.selectArticle(article);
	}

	@Override
	public PageInfo<Article> selectArticle(Article article, int pageNum, int pageSize) {

		PageHelper.startPage(pageNum, pageSize);
		List<Article> list = articleDao.selectArticle(article);
		PageInfo page = new PageInfo(list);
		
		return page;
	}

}
