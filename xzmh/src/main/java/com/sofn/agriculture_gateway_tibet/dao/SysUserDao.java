package com.sofn.agriculture_gateway_tibet.dao;

import org.springframework.stereotype.Repository;

import com.sofn.agriculture_gateway_tibet.entity.SysComAdmin;

/**
 * 系统用户dao
 * @author Administrator
 *
 */
@Repository
public interface SysUserDao {
	
	SysComAdmin selectSysAdminByusernameAndPasswd(String username);
	
	int changePasswd(SysComAdmin admin);

}
