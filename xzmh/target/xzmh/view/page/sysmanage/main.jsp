<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String basePath = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理主页</title>
</head>
<body>
	<div class="modal fade in" id="newusermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">新用户信息</h4>
					</div>
					<div class="modal-body">
						<form action="<%=basePath %>sys/newUser.do" method="post" id="newUserForm"  class="form-horizontal">
						
							<fieldset>
								<legend>基本信息</legend>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 姓名 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="name"  required data-bv-notempty-message="姓名不能为空" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3" for="inputSuccess"> 性别 </label>
									<div class="radio col-lg-7">
										<label> <input type="radio" name="gender" value="male" checked="checked"/>
											Male
										</label>
										<label> <input type="radio" name="gender" value="female" />
											Female
										</label>
										<label> <input type="radio" name="gender" value="other" />
											Other
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3" > 电话 </label>
									<div class="col-lg-7">
										<%-- <input type="text" name="mobile" class="form-control" data-bv-stringlength="true" data-bv-stringlength-min="11" 
										data-bv-threshold="11" data-bv-stringlength-max="11" pattern="(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})" 
										required data-bv-notempty-message="请输入11位手机号码" 
										data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>sys/checkMobile" data-bv-remote-message="电话号码已存在"/> --%>
										<input type="text" name="mobile" class="form-control"  data-bv-threshold="11" 
										required data-bv-notempty-message="请输入11位手机号码" 
										data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>sys/checkMobile" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3" >邮箱 </label>
									<div class="col-lg-7">
										<input type="email" name="email" class="form-control"
											data-bv-threshold="7" required data-bv-notempty-message="邮箱不能为空" data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>sys/checkEmail" data-bv-remote-message="邮箱已存在" />
									</div>
								</div>
							</fieldset>
								<div class="form-group">
									<div class="col-lg-5 col-lg-offset-3">
										<div class="checkbox">
											<label>
												<input type="checkbox" id="acountchoice" value="true" name="account" />设置账户信息
											</label>
										</div>
									</div>
								</div>
							<fieldset>
								<div id="acountInfo" style="display: none;">
									<legend>账户信息</legend>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">用户名</label>
										<div class="col-lg-7">
											<input type="text" class="form-control" name="userName" data-bv-message="用户名不能为空" required data-bv-notempty-message="用户名不能为空"
											pattern="^[a-zA-Z0-9]+$" data-bv-regexp-message="用户名由8-16位字母或数字组成" data-bv-stringlength="true" data-bv-stringlength-min="6" 
											data-bv-stringlength-max="30" data-bv-stringlength-message="用户名由8-16位字母或数字组成" data-bv-different="true" data-bv-different-field="password" 
											data-bv-different-message="用户名不能和密码一致" data-bv-threshold="6" data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>sys/checkUserName" data-bv-remote-message="用户名已存在"
											/>	
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">密码</label>
										<div class="col-lg-7">
											<input type="password" class="form-control" name="password"
											required data-bv-notempty-message="密码不能为空"
											data-bv-identical="true" data-bv-identical-field="confirmPassword" data-bv-identical-message="两次密码输入不一致"
											data-bv-different="true" data-bv-different-field="userName" data-bv-different-message="密码不能与用户名一致"/>
										</div>
									</div>
										
									<div class="form-group">
										<label class="col-lg-3 control-label">确认密码</label>
										<div class="col-lg-7">
											<input type="password" class="form-control" name="confirmPassword"
											required data-bv-notempty-message="确认密码不能为空"
											data-bv-identical="true" data-bv-identical-field="password" data-bv-identical-message="两次输入密码不一致"
											data-bv-different="true" data-bv-different-field="userName" data-bv-different-message="密码不能与用户名一致"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">是否立即生效</label>
										<div class="col-lg-7">
											<div class="checkbox">
												<label>
													<input type="checkbox"  value="1" name="status" />立即生效
												</label>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
							</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" id="newusersub">提交</button>
					</div>
				</div>
			
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>




	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</body>


</html>