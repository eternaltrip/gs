package com.sofn.agriculture_gateway_tibet.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sofn.agriculture_gateway_tibet.common.util.Md5encyptUtil;
import com.sofn.agriculture_gateway_tibet.dao.SysUserDao;
import com.sofn.agriculture_gateway_tibet.entity.SysComAdmin;
import com.sofn.agriculture_gateway_tibet.service.SysUserService;

@Service
public class SysComAdminServiceImpl implements SysUserService {

	@Autowired
	private SysUserDao sysUserDao;
	
	@Override
	public SysComAdmin sysLogin(String username ,String passwd) {
		SysComAdmin admin = sysUserDao.selectSysAdminByusernameAndPasswd(username);
		if(admin != null){
			try {
				if(Md5encyptUtil.validPassword( passwd , admin.getUserPwd() ) ){
					return admin;
				}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public Boolean changePasswd(String accountId, String passwd) {
		int no = sysUserDao.changePasswd(accountId, passwd);
		if(no == 1) {
			return true;
		}
		return false;
	}

}
