<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String basePath = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE>
<html lang="en">

<head>


<title>系统管理后台</title>

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
	src="<%=basePath%>statics/plugin/jquery-form/jquery.form.3.46.js" ></script>
</head>

<body style="background-color:  #2580b9;width: 100%;height: 100%;">

	<div class="container" style="background-color:  #2580b9;width: 100%;height: 100%;">
	
		<div class="row">
		<div style="height: 20%;"></div>
			<h2 style="color: white;text-align: center;">西藏自治区农产品质量安全网后台管理系统</h2>
			<div  style="width: 400px; margin-left:auto;margin-right:auto;">
				<div class="login-panel panel panel-default" style="margin-top:20px;">
					<div class="panel-heading">
						<h3 class="panel-title">管理员登录</h3>
					</div>
					<div class="panel-body" style="padding: 30px 50px 30px 50px;">
						<form role="form" id=""  >
							<fieldset>
								<div class="form-group input-group">
									<span class="input-group-addon">帐号</span>
									<input class="form-control" placeholder="输入帐号" name="account" type="text" autofocus>
								</div>
								<br>
								<div class="form-group input-group">
									<span class="input-group-addon">密码</span>
									<input class="form-control" placeholder="输入用密码" name="password" type="password" >
								</div>
								<br>
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-default btn-primary btn-block">登录</a>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/login.js"></script>
</body>

</html>
