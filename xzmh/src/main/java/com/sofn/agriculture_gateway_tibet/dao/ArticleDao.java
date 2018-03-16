package com.sofn.agriculture_gateway_tibet.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sofn.agriculture_gateway_tibet.entity.Article;


/**
 * 文章数据接口
 * @author yangjin
 *
 */
@Repository
public interface ArticleDao {
	
	/**
	 * 添加文章
	 * @return
	 */
	int Article_Add(Article article);
	
	
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
	
	
	

}
