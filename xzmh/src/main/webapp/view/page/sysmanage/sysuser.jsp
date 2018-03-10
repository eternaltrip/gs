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
<title>用户管理</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						用户信息列表
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-primary btn-xs"
									data-toggle="modal" data-target="#newusermodal">新增</button>
							</div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="userinfoList">
							<thead>
								<tr>
									<th>序号</th>
									<th>名称</th>
									<th>性别</th>
									<th>移动手机</th>
									<th>邮箱</th>
									<th>当前状态</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="user" varStatus="item">
									<c:if test="${item.index%2 == 0 }">
										<tr class="odd gradeX" pid="${user.userid }">
									</c:if>
									<c:if test="${item.index%2 != 0 }">
										<tr class="even gradeC" pid="${user.userid }">
									</c:if>
									<td class="center">${item.index + 1}</td>
									<td class="center">${user.name }</td>
									<td class="center">${user.gender }</td>
									<td class="center">${user.mobile }</td>
									<td class="center">${user.email }</td>
									<td class="center">${user.status }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>

	<div class="modal fade in" id="newusermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">新用户信息</h4>
					</div>
					<div class="modal-body">
						<form action="<%=basePath %>sys/newUser" method="post" id="newUserForm"  class="form-horizontal">
						
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



	<script type="text/javascript" src="<%=basePath%>statics/js/dataTables_use.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			
			//调用表单处理
			dataTableProcess("#userinfoList");
			
			//启动验证
			$('#newUserForm').bootstrapValidator({
				excluded: [':disabled', ':hidden', ':not(:visible)'],//设置影藏的元素不进行验证。方便后面的模块直接进行隐藏或者显示。
				message: '验证未通过',
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					mobile:{
						message:'电话号码输入无效',
						threshold : 11 ,//满足11为才发送ajax验证
						validators :{
							notEmpty:{
								message:'电话号码不能为空'
							},
							remote:{//ajax验证
								url:'<%=basePath %>sys/checkMobile',
								message:'电话号码已存在',
								delay:1000,
								type:'GET'
							}
							
						}
					}
					
					
				}
			}).on('change', '#acountchoice', function() {
				var sameAsSender = $(this).is(':checked');
				if (!sameAsSender) {
					$('#acountInfo').hide();
				} else {
					$('#acountInfo').show();
				}
				
			}).on('success.form.bv', function(e) {
				// Prevent form submission
				e.preventDefault();
				
				// Get the form instance
				var $form = $(e.target);
				
				// Get the BootstrapValidator instance
				var bv = $form.data('bootstrapValidator');
				
				// Use Ajax to submit form data
				$.post($form.attr('action'), $form.serialize(), function(result) {
					alert(result.info);
				}, 'json');
			});

		
			
			//按钮提交
			$("#newusersub").click(function(){
				formcheck();
			});
			
			//form手动检查（适用于form外其他按键进行检查）
			function formcheck(){
				$('#newUserForm').bootstrapValidator('validate');
				var bootstrapValidator = $('#newUserForm').data('bootstrapValidator');
			}
			
			
			

			//双击行事件
			$("#userinfoList").find("tbody tr").dblclick(function() {
				loadUserInfo($(this).attr("pid"));
			});
			//查询用户信息
			function loadUserInfo(userid) {
				var url = "<%=basePath%>sys/userInfo?userId=" + userid
				$.ajax({
					url : url,
					dataType : 'json',
					success : function(result) {
						alert(result.user);
					}
				});
			}

		});
	</script>
</body>


</html>