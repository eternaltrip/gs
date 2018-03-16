package com.sofn.agriculture_gateway_tibet.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 导航标题
 * @author Administrator
 *
 */
public class NavigationTitle implements Serializable{
	
	
	private static final long serialVersionUID = -6991466176425360274L;
	private String tId;//数据id	
	private String tName;//导航标题名
	private String tCode;//导航标题编码--暂时不需要用到
	private String tIndex;//序号
	private int tEnableState;//是否启用(1:开启，0：关闭)
	private String tPic;//导航标题图片
	
	private Integer isUrl;//是否是链接
	private String tUrl;//链接地址
	private Date createTime;
	private Date updateTime;
	
	private List<Article> articles; //对应的文章
	
	/**
	 * 检查必要元素是否为空
	 * @return
	 */
	public boolean checkMustNeed() {
		if(tName != null  && tIndex !=null ) {
			return true;
		}
		return false;
	}
	
	

	public int gettEnableState() {
		return tEnableState;
	}



	public void settEnableState(int tEnableState) {
		this.tEnableState = tEnableState;
	}



	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettCode() {
		return tCode;
	}

	public void settCode(String tCode) {
		this.tCode = tCode;
	}

	public String gettIndex() {
		return tIndex;
	}

	public void settIndex(String tIndex) {
		this.tIndex = tIndex;
	}

	public String gettPic() {
		return tPic;
	}

	public void settPic(String tPic) {
		this.tPic = tPic;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}



	public Integer getIsUrl() {
		return isUrl;
	}



	public void setIsUrl(Integer isUrl) {
		this.isUrl = isUrl;
	}



	public String gettUrl() {
		return tUrl;
	}



	public void settUrl(String tUrl) {
		this.tUrl = tUrl;
	}
	
}
