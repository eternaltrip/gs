package com.sofn.agriculture_gateway_tibet.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统用户
 * @author Administrator
 *
 */
public class SysComAdmin implements Serializable{
	private static final long serialVersionUID = -8361378472670710746L;
	private String id;//id
	private String realName;//真实姓名
	private String userName;//用户帐号
	private String userPwd;//用户密码
	private String name;//用户姓名
	private String companyId;//企业id
	private String organizeId;//所属部门id
	private String organizeName;//所属部门名字
	private String userStatus;//用户状态
	private String remark;//备注
	private Date operationDate;//操作时间
	private String mobile;//手机
	private String email;//email
	private String telephone;//电话
	private String organizationName;//组织机构名称
	private String accountRole;//用户角色关系
	private String userClass;//用户类型  1：政府用户  2：企业用户
	private String companyName;//企业名称
	private String atten;//联系人
	private String roleName;//角色  wds修改于2016-09-13 网格化监管人员用
	private String subOrganize;//下级部门  wds修改于2016-09-13 网格化监管人员用
	private String subOrganizeName;//下级部门  wds修改于2016-09-13 网格化监管人员用
	private String parentId;//上级资源id  wds修改于2016-09-14 管理部门用
	private String state;//状态  wds修改于2016-09-14 管理部门用
	private String longitude;//经度  wds修改于2016-09-19 管理部门用
	private String latitude;//纬度  wds修改于2016-09-19 管理部门用

	private String updateUserId;//最近一次修改人ID
	private String updateUserName;//最近一次修改人姓名
	private String updateTime;//最近一次修改时间
	
	private Boolean isTfy;//是否属于天府缘
	
	private String loginNum;//登录次数
	private Date lastLoginTime;//最后一次登录时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getOrganizeId() {
		return organizeId;
	}
	public void setOrganizeId(String organizeId) {
		this.organizeId = organizeId;
	}
	public String getOrganizeName() {
		return organizeName;
	}
	public void setOrganizeName(String organizeName) {
		this.organizeName = organizeName;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getOperationDate() {
		return operationDate;
	}
	public void setOperationDate(Date operationDate) {
		this.operationDate = operationDate;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getAccountRole() {
		return accountRole;
	}
	public void setAccountRole(String accountRole) {
		this.accountRole = accountRole;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAtten() {
		return atten;
	}
	public void setAtten(String atten) {
		this.atten = atten;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getSubOrganize() {
		return subOrganize;
	}
	public void setSubOrganize(String subOrganize) {
		this.subOrganize = subOrganize;
	}
	public String getSubOrganizeName() {
		return subOrganizeName;
	}
	public void setSubOrganizeName(String subOrganizeName) {
		this.subOrganizeName = subOrganizeName;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getUpdateUserName() {
		return updateUserName;
	}
	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public void setIsTfy(Boolean isTfy) {
		this.isTfy = isTfy;
	}
	public Boolean getIsTfy() {
		return isTfy;
	}

	public String getLoginNum() {
		return loginNum;
	}
	public void setLoginNum(String loginNum) {
		this.loginNum = loginNum;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	
	
	
	

}
