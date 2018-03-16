package com.sofn.agriculture_gateway_tibet.dao;

import java.util.List;
import java.util.Map;

import com.sofn.agriculture_gateway_tibet.entity.OtherLink;

public interface OtherLinkDao {
	int deleteByPrimaryKey(String lid);

	int insert(OtherLink record);

	int insertSelective(OtherLink record);

	OtherLink selectByPrimaryKey(String lid);

	int updateByPrimaryKeySelective(OtherLink record);

	int updateByPrimaryKey(OtherLink record);

	List<OtherLink> selectAll(Map map);
}