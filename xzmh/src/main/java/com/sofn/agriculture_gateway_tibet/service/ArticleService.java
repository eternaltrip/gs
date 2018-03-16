package com.sofn.agriculture_gateway_tibet.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.entity.Article;

public interface ArticleService {
	/**
	 * 添加文章
	 * @return
	 */
	int Article_Add(Article articles);
	
	
	/**
	 * 删除文章
	 * @return
	 */
	int Article_Delete(String ttid);
	
	/**
	 * 修改文章
	 * @return
	 */
	int Article_Update(Article article);
	
	/**
	 * 查询文章。
	 * @param map
	 * @return
	 */
	List<Article> selectArticle(Article article);
	
	
	/**
	 * 查询文章-分页。
	 * @param map
	 * @return
	 */
	PageInfo<Article> selectArticle(Article article, int pageNum, int pageSize);
}
