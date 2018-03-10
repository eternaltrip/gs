<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String basePath = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property='title' /></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">



<!-- Bootstrap Core CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- 日期控件 css-->
<link
	href="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/css/timeline.css"
	rel="stylesheet">
<!-- Morris Charts CSS -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/morrisjs/morris.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link
	href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/css/sb-admin-2.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=basePath%>statics/plugin/bootstrapvalidator-master/dist/css/bootstrapValidator.css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- jQuery -->
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Morris Charts JavaScript -->
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/raphael/raphael.min.js"></script>
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/morrisjs/morris.min.js"></script>
<script
	src="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.js"></script>
<script
	src="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script
	src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/js/sb-admin-2.js"></script>
<script
	src="<%=basePath%>statics/plugin/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
<script
	src="<%=basePath%>statics/plugin/jquery-form/jquery.form.3.46.js"></script>
<sitemesh:write property='head' />
</head>
<body>

	<nav class="navbar navbar-default  navbar-static-top " role="navigation" style="margin-bottom: 0;">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html">西藏自治区门户管理系统</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown" style="max-width: auto;">
				<a  class="dropdown-toggle" data-toggle="dropdown" href="#"> <span>管理员，欢迎您！</span>
					<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 修改密码</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a></li>
				</ul>
			</li>
		</ul>

		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">

			<div class="sidebar-nav navbar-collapse">
				<div class="alert alert-info" style="padding:10px 15px 10px 15px;margin-bottom: 0px;">
					<i class="fa  fa-desktop fa-fw"></i>系统菜单
				</div>
				<ul class="nav" id="side-menu">
					<li><a href="#"><i class="fa fa-th-large  fa-fw"></i>
							导航标题<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="<%=basePath%>title"><i class="fa  fa-list  fa-fw"></i>导航标题列表</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-list-alt  fa-fw"></i>
							新闻咨询<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">Second Level Item</a></li>
							<li><a href="#">Second Level Item</a></li>
							<!-- <li><a href="#">Third Level <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a href="#">Third Level Item</a></li>
									<li><a href="#">Third Level Item</a></li>
									<li><a href="#">Third Level Item</a></li>
									<li><a href="#">Third Level Item</a></li>
								</ul> 
							</li> -->
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-wrench fa-fw"></i>
							系统设置<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="blank.html">Blank Page</a></li>
							<li><a href="login.html">Login Page</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
	</nav>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<sitemesh:write property='title' />
				</h3>
			</div>
		</div>

		<div class="row">
			<sitemesh:write property='body' />
		</div>

	</div>
<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/titlemanage.js" />
</body>
</html>