<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String basePath = HostServerHandler.hostPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>国家农产品质量安全监管追溯信息网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<META http-equiv="X-UA-Compatible" content="IE=8">
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/jquery.marquee.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/index.css">
	<script type="text/javascript" src="<%=basePath%>statics/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="<%=basePath%>statics/js/koala.js"></script>
	<script type="text/javascript" src="<%=basePath%>statics/js/jquery.marquee.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>statics/js/bootstrap.min.js"></script>
	
	

<sitemesh:write property='head' />
</head>
<body>
	<div class="bg1" >
		<div class="top">
			<div class="t_logo">
				<a href="<%=basePath%>" target="_self">
					<img alt="追溯系统" src="<%=basePath%>statics/images/logo_system_select.png">
				</a>
				<a href="<%=basePath%>"> <span class="logo-title">西藏自治区农业产品质量安全追溯信息网</span></a>
			</div>
			<!-- <div class="serverline">
				服务热线： <span>400-7023-888</span>
			</div> -->
		</div>
	
		<!--导航栏 begin-->
		<div id="menu">
			<ul class="daohang">
				<c:forEach items="${titles }" var="title">
					<li class="daohang-li ">
						<c:choose>
							<c:when test="${title.isUrl == 1 || title.isUrl == '1' }">
								<a href="${title.tUrl}">${title.tName }</a>
							</c:when>
							<c:otherwise>
								<a href="<%=basePath%>home/list.do?tId=${title.tId}">${title.tName }</a>
							</c:otherwise>
						</c:choose>
						<ul class="daohang-li-menu" style="display: none;">
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 首页用下面这个模块 -->
		<c:if test="${isindex == true }">
			<!-- 子页模块加载 start-->
			<sitemesh:write property='body' />
			<!-- 子页模块加载 end -->
		</c:if>
		
		
		<!-- 非首页用下面这个模块 -->
		<c:if test="${islist == true || isdetails == true }">
			<div class="local">
				<span>当前位置：</span>
				<a href="<%=basePath%>">首页</a>&nbsp;>
				<a href="<%=basePath%>home/list.do?tId=${title.tId}" class="current_local">${title.tName }</a>
			</div>
			<div class="list" style="min-height: 500px;height: auto;">
			
				<!-- 子页模块加载 start-->
				<sitemesh:write property='body' />
				<!-- 子页模块加载 end -->
			
				<div class="list_right" >
					<div class="list_right_top">
						<div class="kjrk">
							<div class="main-tit current-tit" style="width:210px;font-size:14px;">西藏自治区追溯平台快捷入口</div>
						</div>
						<div class="kjrk_link">
							<img src="<%=basePath%>statics/images/rk1.jpg" alt="" />
							<div class="content" style="background:#eefff5;">
								<a href="#" style="color:#474948;font-size:14px;font-weight:900;">企业追溯平台</a>
								<a href="#" style="color:#929894;font-size:12px;">企业追溯平台简介</a>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="kjrk_link">
							<img src="<%=basePath%>statics/images/rk2.jpg" alt="" />
							<div class="content" style="background:#ebfaff;">
								<a href="#" style="color:#474948;font-size:14px;font-weight:900;">政府监管平台</a>
								<a href="#" style="color:#929894;font-size:12px;">政府监管平台简介</a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				<c:if test="${isdetails == true }">
					<div class="list_right_bottom">
						<div class="kjrk">
							<div class="main-tit current-tit" style="width:100px;">${title.tName}</div>
						</div>
						<div class="zixun">
							<ul>
								<c:forEach var="info" items="${relates }">
									<li style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
										<a href="<%=basePath%>home/details.do?aId=${info.aId}">${info.aTitle }</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:if>
				</div>
			</div>
		</c:if>
			
		
		
		
		
	</div>
	<div class="clearfix"></div>
	<div class="footer">
		<div class="bg1">
			<div class="pleft">
				<div class="lm_title" style="float: left">
					<div class="lm_name">
						<a class="tit">友情链接</a>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<ul class="links">
				<c:forEach items="${links }" var="link">
					<li><a href="${link.linkaddr }">${link.linkname }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="endword">
		<div class="bg2">
			<div class="clearfix"></div>
			<p>版权所有：西藏自治区农产品质量安全追溯信息网</p>
			<p>技术支持：成都曙光光纤网络有限责任公司</p>
		</div>
	</div>
	
</body>
</html>