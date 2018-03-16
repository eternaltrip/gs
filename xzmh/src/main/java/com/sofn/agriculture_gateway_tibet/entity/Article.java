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
	/* 新闻资讯标题*/
	private String aTitle;
	/* 作者*/
	private String aAuthor;
	/* 文章来源*/
	private String aSources;
	/* 文章标题图*/
	private String aPic;
	
	/* 文章内容-简介*/
	private String aContextSimple;
	
	/* 文章内容*/
	private String aContext;
	/*所属导航标题id*/
	private String titleId;
	/*是否启用  0:不是 ,1:是*/
	private Integer aEnableState;
	/*是否置顶  0:不是 ,1:是*/
	private Integer aEnableTop;
	/*是否头条  0:不是 ,1:是*/
	private Integer aEnableHeadline;
	/*头条顺序  1，2，3...*/
	private Integer aHeadlineSort;
	
	/* 创建时间*/
	private Date createTime;
	/* 修改时间*/
	private Date updateTime;
	
	
	private String titleName;//级联查询对象（导航标题名）
	
	private Date endTime;//结束时间。查询参数字段，数据库不存在。
	
	private Date startTime;//开始时间。查询参数字段，数据库不存在。

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
		this.aSources =  aSources ;
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
		this.titleId = titleId.equals("-1") ? null : titleId ;
	}

	public Integer getaEnableState() {
		return aEnableState;
	}

	public void setaEnableState(Integer aEnableState) {
		this.aEnableState = aEnableState == -1 ? null : aEnableState;
	}

	public Integer getaEnableTop() {
		return aEnableTop;
	}

	public void setaEnableTop(Integer aEnableTop) {
		this.aEnableTop = aEnableTop== -1 ? null : aEnableTop;
	}

	public Integer getaEnableHeadline() {
		return aEnableHeadline;
	}

	public void setaEnableHeadline(Integer aEnableHeadline) {
		this.aEnableHeadline = aEnableHeadline == -1 ? null : aEnableHeadline;
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

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getaContextSimple() {
		return aContextSimple;
	}

	public void setaContextSimple(String aContextSimple) {
		this.aContextSimple = aContextSimple;
	}

	
}
