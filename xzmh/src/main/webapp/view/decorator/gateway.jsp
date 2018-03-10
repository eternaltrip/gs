<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String path = HostServerHandler.hostPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:write property='title' /></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<META http-equiv="X-UA-Compatible" content="IE=8">
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=path%>statics/css/jquery.marquee.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>statics/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>statics/css/index.css">
	<script type="text/javascript" src="<%=path%>statics/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="<%=path%>statics/js/koala.js"></script>
	<script type="text/javascript" src="<%=path%>statics/js/jquery.marquee.min.js"></script>
	<script type="text/javascript" src="<%=path%>statics/js/bootstrap.min.js"></script>

<sitemesh:write property='head' />
</head>
<body>
	<div>
		<div class="bg1">
			<div class="top">
				<div class="t_logo">
					<a href="#" target="_self"> <img alt="追溯系统"
						src="<%=path%>statics/images/logo_system_select.png">
					</a> <a href="#"> <span class="logo-title">西藏自治区农业产品质量安全追溯信息网</span>
					</a>
				</div>
				<!-- <div class="serverline">
					服务热线： <span>400-7023-888</span>
				</div> -->
			</div>
		
			<!--导航栏 begin-->
			<div id="menu">
				<ul class="daohang">
					<li class="daohang-li "><a href="#">网站首页</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">企业展示</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">基地展示</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">投诉处理</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">政策法规</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">新闻资讯</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">平台介绍</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<li class="daohang-li "><a href="#">行业动态</a>
						<ul class="daohang-li-menu" style="display: none;">
	
						</ul></li>
	
					<!-- <li class="daohang-li ">
	                <a href="#">品台介绍</a>
	                <ul class="daohang-li-menu" style="display: none;">
	
	                </ul>
	            </li> -->
				</ul>
			</div>
			<sitemesh:write property='body' />
		</div>
		<!-- <script type="text/javascript">
        $(".daohang-li").hover(
                function () {
                    $(this).addClass("daohang-li-hover");
                },
                function () {
                    $(this).removeClass("daohang-li-hover");
                });
    </script> -->
		<!--导航栏 end-->
	<div class="footer">
		<div class="bg1">
			<div class="pleft">
				<div class="lm_title" style="float: left">
					<div class="lm_name">
						<a class="tit" href="#">友情链接</a>
					</div>
				</div>
				<a href="#" class="more" style="margin-top: 20px;">更多>></a>
			</div>
			<div class="clearfix"></div>
			<ul class="links">
				<li><a href="#">中国绿色食品发展中心</a></li>
				<li><a href="#">四川省绿色食品发展中心</a></li>
				<li><a href="#">四川省农业厅</a></li>
				<li><a href="#">四川省商务局</a></li>
				<li><a href="#">其他农产品质量安全追溯网</a></li>
			</ul>
		</div>
	</div>
	<div class="endword">
		<div class="bg2">
			<ul class="nav1">
				<li><a href="#">网站首页</a></li>
				<li><a href="#">企业展示</a></li>
				<li><a href="#">基地展示</a></li>
				<li><a href="#">投诉处理</a></li>
				<li><a href="#">政策法规</a></li>
				<li><a href="#">新闻资讯</a></li>
				<li><a href="#">品台介绍</a></li>
				<li><a href="#">行业动态</a></li>
			</ul>
			<div class="clearfix"></div>
			<p>版权所有：西藏自治区农产品质量安全追溯信息网</p>
			<p>技术支持：成都曙光光纤网络有限责任公司</p>
		</div>
	</div>
	</div>
	
	
</body>
</html>