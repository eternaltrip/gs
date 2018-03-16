package com.sofn.agriculture_gateway_tibet.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sofn.agriculture_gateway_tibet.common.util.UuidTool;
import com.sofn.agriculture_gateway_tibet.dao.NavigationTitleDao;
import com.sofn.agriculture_gateway_tibet.entity.Article;
import com.sofn.agriculture_gateway_tibet.entity.NavigationTitle;
import com.sofn.agriculture_gateway_tibet.service.NavigationTitleService;

@Service
public class NavigationTitleServiceImpl implements NavigationTitleService {

	@Autowired
	private NavigationTitleDao titlesDao;

	@Override
	public PageInfo<NavigationTitle> AllTitlesPaging(int currentPage , int pageSize ,Map map) {
		PageHelper.startPage(currentPage, pageSize);
		List<NavigationTitle> list = titlesDao.AllTitles(map);
		PageInfo<NavigationTitle> pageInfo = new PageInfo<NavigationTitle>(list);
		return pageInfo;
	}
	
	@Override
	public List<NavigationTitle> AllTitles(Map map) {
		List<NavigationTitle> list = titlesDao.AllTitles(map);
		return list;
	}

	@Override
	public int addTitle(List<NavigationTitle> titles) {

		if (titles == null && titles.size() == 0) {
			return 0;
		}

		for (NavigationTitle title : titles) {
			title.settId(new UuidTool().getUuid());
			title.setCreateTime(new Date());
			title.setUpdateTime(new Date());
		}
		return titlesDao.addTitle(titles);
	}

	@Override
	public int deleteTitle(String titleId) {
		return titlesDao.deleteTitle(titleId);
	}

	@Override
	public int updateTitle(NavigationTitle titles) {
		titles.setUpdateTime(new Date());
		return titlesDao.updateTitle(titles);
	}

	@Override
	public int addTitle(NavigationTitle title) {
		if (title != null) {
			title.settId(new UuidTool().getUuid());
			title.setCreateTime(new Date());
			title.setUpdateTime(new Date());
			
			List<NavigationTitle> list = new ArrayList<NavigationTitle>();
			list.add(title);
			return titlesDao.addTitle(list);
		}
		return 0;
	}

}
