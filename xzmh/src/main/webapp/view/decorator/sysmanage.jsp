<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String basePath = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property='title' /></title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">



<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/bootstrap/css/bootstrap.min.css">
<!-- MetisMenu CSS -->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/metisMenu/metisMenu.min.css">
<!-- DataTables CSS -->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-plugins/dataTables.bootstrap.css">
<!-- DataTables Responsive CSS -->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-responsive/dataTables.responsive.css">
<!-- 日期控件 css-->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.css">
<!-- Timeline CSS -->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/css/timeline.css">
<!-- Custom Fonts -->
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/css/sb-admin-2.css">
<link rel="stylesheet"  href="<%=basePath%>statics/plugin/bootstrapvalidator-master/dist/css/bootstrapValidator.css" />


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

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/vendor/datatables-responsive/dataTables.responsive.js"></script>


<script src="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>statics/plugin/bootstrap-daterangepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=basePath%>statics/plugin/startbootstrap-sb-admin-2-1.0.8/dist/js/sb-admin-2.js"></script>
<script src="<%=basePath%>statics/plugin/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
<script src="<%=basePath%>statics/plugin/jquery-form/jquery.form.3.46.js"></script>





<sitemesh:write property='head' />
</head>
<body>
	<input id="basePath" value="<%=basePath%>" type="hidden"/> 
	<nav class="navbar navbar-default  navbar-static-top " role="navigation" style="margin-bottom: 0;">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html">西藏自治区门户管理系统</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown" style="max-width: auto;">
				<a  class="dropdown-toggle" data-toggle="dropdown" > <span>${sessionScope.usercontent.realName },欢迎您！</span>
					<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<!-- <li><a ><i class="fa fa-user fa-fw"></i> 个人信息</a></li> -->
					<li><a data-toggle="modal" data-target="#changepwmodal" ><i class="fa fa-gear fa-fw"></i> 修改密码</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>account/loginOut"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a></li>
				</ul>
			</li>
		</ul>


		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<div class="alert alert-info" style="padding:10px 15px 10px 15px;margin-bottom: 0px;">
					<i class="fa  fa-desktop fa-fw"></i>系统菜单
				</div>
				<ul class="nav" id="side-menu">
					<li><a href="#"><i class="fa fa-th-large  fa-fw"></i>
							导航标题<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="<%=basePath%>title.do"><i class="fa  fa-list  fa-fw"></i>导航标题-列表</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-list-alt  fa-fw"></i>
							新闻资讯<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="<%=basePath%>article.do">新闻资讯-列表</a></li>
							<li><a href="<%=basePath%>article/newpage.do">新闻资讯-编辑</a></li>
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
							<li><a href="<%=basePath%>link.do">友情链接-管理</a></li>
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
				<h3 class="page-header" style="margin-bottom: 5px;">
					<sitemesh:write property='title' />
				</h3>
			</div>
		</div>

		<div class="row" id="childDiv" >
			<sitemesh:write property='body' />
		</div>

	</div>
	
	<!-- 消息提示窗口 -->
	<div class="modal  fade in " id="messModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="messhead">提示<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
				</div>
				<div class="modal-body" style="text-align: center;" >
					<h3 id="messcontent"></h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary  col-xs-4 col-xs-offset-4"  id="messcomfirm">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 密码提示窗口 -->
	<div class="modal  fade in " id="changepwinfomodal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">提示<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
				</div>
				<div class="modal-body" style="text-align: center;" >
					<h3 ></h3>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-primary col-xs-4 col-xs-offset-4" >确定</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 密码修改 -->
	<div class="modal  fade in " id="changepwmodal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="messhead">密码修改<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
				</div>
				<div class="modal-body"  >
					<form action="<%=basePath%>account/changePW" method="post" id="changepw" class="form-horizontal">
						<div class="form-group">
							<label class="col-lg-3 control-label">旧密码</label>
							<div class="col-lg-7">
								<input type="password" class="form-control" name="oldpasswd"
								required data-bv-notempty-message="旧密码不能为空"
								data-bv-different="true" data-bv-different-field="newpasswd" data-bv-different-message="密码不能与用户名一致"
								pattern="^[a-zA-Z0-9]+$" data-bv-regexp-message="密码由6-20位字母或数字组成" data-bv-stringlength="true" data-bv-stringlength-min="6" 
								data-bv-stringlength-max="20" data-bv-stringlength-message="密码由6-20位字母或数字组成" data-bv-different="true" 
								data-bv-threshold="6" data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>account/checkOldPw" 
								/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-3 control-label">新密码</label>
							<div class="col-lg-7">
								<input type="password" class="form-control" name="newpasswd" required data-bv-notempty-message="新密码不能为空"
								data-bv-identical="true" data-bv-identical-field="confirmPassword" data-bv-identical-message="新密码与确认密码不一致"
								data-bv-different="true" data-bv-different-field="oldpasswd" data-bv-different-message="新密码不能与旧密码一致"
								pattern="^[a-zA-Z0-9]+$" data-bv-regexp-message="密码由6-20位字母或数字组成" data-bv-stringlength="true" data-bv-stringlength-min="6" 
								data-bv-stringlength-max="20" data-bv-stringlength-message="密码由6-20位字母或数字组成"
								/>
							</div>
						</div>
							
						<div class="form-group">
							<label class="col-lg-3 control-label">确认密码</label>
							<div class="col-lg-7">
								<input type="password" class="form-control" name="confirmPassword" required data-bv-notempty-message="确认密码不能为空"
								data-bv-identical="true" data-bv-identical-field="newpasswd" data-bv-identical-message="新密码与确认密码不一致"
								data-bv-different="true" data-bv-different-field="oldpasswd" data-bv-different-message="新密码不能与旧密码一致"
								pattern="^[a-zA-Z0-9]+$" data-bv-regexp-message="密码由6-20位字母或数字组成" data-bv-stringlength="true" data-bv-stringlength-min="6" 
								data-bv-stringlength-max="20" data-bv-stringlength-message="密码由6-20位字母或数字组成"
								/>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-primary  col-xs-4 col-xs-offset-4"  id="pwchangeBtn">确认修改</a>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
$(document).ready(function(){
	//启动验证
	$('#changepw').bootstrapValidator({
		excluded: [':disabled', ':hidden', ':not(:visible)'],//设置影藏的元素不进行验证。方便后面的模块直接进行隐藏或者显示。
		message: '验证未通过',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		var $form = $(e.target);
		var bv = $form.data('bootstrapValidator');
		$.post($form.attr('action'), $form.serialize(), function(result) {
			if(result.return_state == "success"){
				$("#changepwinfomodal").find("h3").text("修改成功,请重新登录");
				$("#changepwinfomodal").find("a").attr("state","ok");
			}else{
				$("#changepwinfomodal").find("h3").text(result.return_mess);
			}
			$("#changepwmodal").modal("hide");
			$("#changepwinfomodal").modal("show");
		}, 'json');
	});


	
	//修改密码提交
	$("#pwchangeBtn").click(function(){
		$('#changepw').bootstrapValidator('validate');
		var bootstrapValidator = $('#changepw').data('bootstrapValidator');
	});
	
	//修改密码确认
	$("#changepwinfomodal").find("a").click(function(){
		var isok = $(this).attr("state");
		if(isok == "ok"){
			location.href="<%=basePath%>account";
		}else{
			$("#changepwinfomodal").modal("hide");
			$("#changepwmodal").modal("show");
		}
	});


})

	var DateTime = function getMyDate(time , type) {
		var oDate = new Date(time);
		oYear = oDate.getFullYear(); 
		oMonth = oDate.getMonth() + 1; 
		oDay = oDate.getDate();
		oHour = oDate.getHours(); 
		oMin = oDate.getMinutes(); 
		oSen = oDate.getSeconds(); 
		if(type == "long"){
			oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间  
		}else{
			oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay);//最后拼接时间
		}
		return oTime;
	};

		//补0操作,当时间数据小于10的时候，给该数据前面加一个0  
	function getzf(num) {
		if (parseInt(num) < 10) {
			num = '0' + num;
		}
		return num;
	}
</script>


</html>