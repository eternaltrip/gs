package com.sofn.agriculture_gateway_tibet.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sofn.agriculture_gateway_tibet.common.util.UuidTool;
import com.sofn.agriculture_gateway_tibet.dao.ArticleDao;
import com.sofn.agriculture_gateway_tibet.entity.Article;
import com.sofn.agriculture_gateway_tibet.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao ;
	
	
	@Override
	public int Article_Add(List<Article> articles) {
		if(articles == null && articles.size() == 0) {
			return 0;
		}
		
		for (Article article : articles) {
			article.setaId(new UuidTool().getUuid());
			article.setCreateTime(new Date());
			article.setUpdateTime(new Date());
		}
		return articleDao.Article_Add(articles);
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
		return articleDao.Article_Update(article);
	}

	@Override
	public List<Article> selectArticle(Map map) {
		return articleDao.selectArticle(map);
	}

}
