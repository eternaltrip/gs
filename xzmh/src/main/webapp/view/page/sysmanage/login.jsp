<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.util.ValidateCodeUtil"%>
<%
	String basePath = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE>
<html lang="en">

<head>





<title>系统管理后台</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- jQuery -->
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/bootstrap/js/bootstrap.min.js"></script>
<script  src="<%=basePath%>statics/plugin/jquery-form/jquery.form.3.46.js" ></script>
	
</head>

<body >
<input id="basePath" value="<%=basePath%>" type="hidden" />
	<div class="container" style="background-color:  #2580b9;width: 100%;height: 100vh;padding-top: 200px;">
	
			
				<h2 style="color: white;text-align: center;">西藏自治区农产品质量安全网后台管理系统</h2>
			<div  style="margin-left:auto;margin-right:auto;text-align: center;width: 400px;">
				<div class="login-panel panel panel-default" style="margin-top:20px;">
					<div class="panel-heading">
						<h3 class="panel-title">管理员登录</h3>
					</div>
					<div class="panel-body " >
					
					
					
						<div style="color: red;font-size: 16px;min-height: 30px;" id="errorinfo">
							
						</div>
						<form role="form"  class="form-horizontal" >
							<fieldset>
								<div class="form-group">
									<label class="col-lg-3 control-label">帐号:</label>
									<div class="col-lg-8">
										<input class="form-control" placeholder="输入帐号" name="username" id="account" type="text" autofocus />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">密码:</label>
									<div class="col-lg-8">
										<input class="form-control" placeholder="输入用密码" name="password" id="password" type="password" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-lg-3 control-label">验证码:</label>
									<div class="col-lg-4">
										<input class="form-control" placeholder="输入验证码" id="imgcode"  type="text" />
									</div>
									<div class="col-lg-4">
										<img src="<%=basePath%>account/img.do" id="imgcodepic" />
									</div>
								</div>
								
								<div class="form-group ">
									<a  class="btn btn-default btn-primary  col-xs-6 col-xs-offset-3" id="login">登录</a>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
	</div>
<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/login.js"></script>
</body>

</html>
