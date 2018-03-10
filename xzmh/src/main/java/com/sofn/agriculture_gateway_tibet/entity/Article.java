package com.sofn.agriculture_gateway_tibet.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻咨询
 * @author yangjin
 *
 */
public class Article implements Serializable{


	private static final long serialVersionUID = 7092758441871631503L;

	/* 数据id*/
	private String aId;
	/* 行业动态标题*/
	private String aTitle;
	/* 作者*/
	private String aAuthor;
	/* 文章来源*/
	private String aSources;
	/* 文章标题图*/
	private String aPic;
	/* 文章内容*/
	private String aContext;
	/*所属导航标题id*/
	private String titleId;
	/*是否启用*/
	private Integer aEnableState;
	/*是否置顶*/
	private Integer aEnableTop;
	/*是否头条*/
	private Integer aEnableHeadline;
	/*头条顺序*/
	private Integer aHeadlineSort;
	
	/* 创建时间*/
	private Date createTime;
	/* 修改时间*/
	private Date updateTime;
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public String getaAuthor() {
		return aAuthor;
	}
	public void setaAuthor(String aAuthor) {
		this.aAuthor = aAuthor;
	}
	public String getaSources() {
		return aSources;
	}
	public void setaSources(String aSources) {
		this.aSources = aSources;
	}
	public String getaPic() {
		return aPic;
	}
	public void setaPic(String aPic) {
		this.aPic = aPic;
	}
	public String getaContext() {
		return aContext;
	}
	public void setaContext(String aContext) {
		this.aContext = aContext;
	}
	public String getTitleId() {
		return titleId;
	}
	public void setTitleId(String titleId) {
		this.titleId = titleId;
	}
	public Integer getaEnableState() {
		return aEnableState;
	}
	public void setaEnableState(Integer aEnableState) {
		this.aEnableState = aEnableState;
	}
	public Integer getaEnableTop() {
		return aEnableTop;
	}
	public void setaEnableTop(Integer aEnableTop) {
		this.aEnableTop = aEnableTop;
	}
	public Integer getaEnableHeadline() {
		return aEnableHeadline;
	}
	public void setaEnableHeadline(Integer aEnableHeadline) {
		this.aEnableHeadline = aEnableHeadline;
	}
	public Integer getaHeadlineSort() {
		return aHeadlineSort;
	}
	public void setaHeadlineSort(Integer aHeadlineSort) {
		this.aHeadlineSort = aHeadlineSort;
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
	
	
	
	
}
