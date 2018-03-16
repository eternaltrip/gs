package com.sofn.agriculture_gateway_tibet.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sofn.agriculture_gateway_tibet.common.util.UuidTool;
import com.sofn.agriculture_gateway_tibet.dao.OtherLinkDao;
import com.sofn.agriculture_gateway_tibet.entity.OtherLink;
import com.sofn.agriculture_gateway_tibet.service.OtherLinkService;


@Service
public class OtherLinkServiceImpl implements OtherLinkService {

		@Autowired
		private OtherLinkDao otherLinkDao;
	
	@Override
	public int deleteByPrimaryKey(String lid) {
		return otherLinkDao.deleteByPrimaryKey(lid);
	}

	@Override
	public int insert(OtherLink record) {
		record.setLid(new UuidTool().getUuid());
		record.setCreatetime(new Date());
		record.setUpdatetime(new Date());
		return otherLinkDao.insert(record);
	}

	@Override
	public int insertSelective(OtherLink record) {
		record.setLid(new UuidTool().getUuid());
		record.setCreatetime(new Date());
		record.setUpdatetime(new Date());
		return otherLinkDao.insertSelective(record);
	}

	@Override
	public OtherLink selectByPrimaryKey(String lid) {
		return otherLinkDao.selectByPrimaryKey(lid);
	}

	@Override
	public List<OtherLink> selectAll(Map map){
		return otherLinkDao.selectAll(map);
	}

	@Override
	public int updateByPrimaryKeySelective(OtherLink record) {
		record.setUpdatetime(new Date());
		return otherLinkDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(OtherLink record) {
		record.setUpdatetime(new Date());
		return otherLinkDao.updateByPrimaryKey(record);
	}

}
