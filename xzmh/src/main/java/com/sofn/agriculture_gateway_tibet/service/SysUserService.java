package com.sofn.agriculture_gateway_tibet.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sofn.agriculture_gateway_tibet.entity.SysComAdmin;



public interface SysUserService {
	/**
	 * 系统用户登录
	 * @param username
	 * @return
	 */
	SysComAdmin sysLogin(String username ,String passwd);
	
	/**
	 * 修改密码
	 * @param accountId
	 * @param passwd
	 * @return
	 */
	Boolean changePasswd(String accountId, String passwd);
	
	
	

}
