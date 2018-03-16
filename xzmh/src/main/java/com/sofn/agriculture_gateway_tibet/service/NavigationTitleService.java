package com.sofn.agriculture_gateway_tibet.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;


/**
 * 标题接口
 * @author Administrator
 *
 */
public interface NavigationTitleService {

	/**
	 * 查询所有标题-分页模式。
	 * @param map
	 * @return
	 */
	public PageInfo<NavigationTitle> AllTitlesPaging(int currentPage , int pageSize ,Map map);
	
	/**
	 * 查询所有标题。
	 * @param map
	 * @return
	 */
	public List<NavigationTitle> AllTitles(Map map);
	
	public int addTitle(List<NavigationTitle> titles);
	
	public int addTitle(NavigationTitle title);
	
	public int deleteTitle(String titleId);
	
	public int updateTitle(NavigationTitle titles);
	
}
