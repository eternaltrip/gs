package com.sofn.agriculture_gateway_tibet.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;

@Repository
public interface NavigationTitleDao {
	
	public List<NavigationTitle> AllTitles(Map map);
	
	public int addTitle(List<NavigationTitle> titles);
	public int deleteTitle(String titleId);
	public int updateTitle(NavigationTitle titles);

}
