package com.sofn.agriculture_gateway_tibet.service;

import java.util.List;
import java.util.Map;

import com.sofn.agriculture_gateway_tibet.entity.OtherLink;

public interface OtherLinkService {

	/**
	 * 通过主键删除
	 * 
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String lid);

	/**
	 * 添加
	 * 
	 * @mbggenerated
	 */
	int insert(OtherLink record);

	/**
	 * 添加部分
	 * 
	 * @mbggenerated
	 */
	int insertSelective(OtherLink record);

	/**
	 * 主键查找
	 * 
	 * @mbggenerated
	 */
	OtherLink selectByPrimaryKey(String lid);

	/**
	 * 主键查找
	 * 
	 * @mbggenerated
	 */
	List<OtherLink> selectAll(Map map);

	/**
	 * 更新部分
	 * 
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(OtherLink record);

	/**
	 * 更新全部
	 * 
	 * @mbggenerated
	 */
	int updateByPrimaryKey(OtherLink record);
}