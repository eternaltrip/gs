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
<title>导航标题管理</title>
</head>
<body>
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						导航标题信息
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newtitlemodal">
									<i class="fa fa-plus fa-fw"></i>新增
								</button>
							</div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="titleinfoList">
							<thead>
								<tr>
									<th style="width: 10%;text-align: center;">序号</th>
									<th style="width: 20%;text-align: center;">标题名称</th>
									<th style="width: 10%;text-align: center;">标题编码</th>
									<th style="width: 10%;text-align: center;">导航顺序</th>
									<th style="width: 20%;text-align: center;">导航图片</th>
									<th style="width: 10%;text-align: center;">启用状态</th>
									<th style="width: 20%;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody style="text-align: center;">
								<c:forEach items="${list }" var="title" varStatus="item">
									<c:if test="${item.index%2 == 0 }">
										<tr class="odd gradeX" tid="${title.tId }">
									</c:if>
									<c:if test="${item.index%2 != 0 }">
										<tr class="even gradeC" tid="${title.tId }">
									</c:if>
										<td class="center">${item.index + 1}</td>
										<td class="center">${title.tName }</td>
										<td class="center">${title.tCode }</td>
										<td class="center">${title.tIndex }</td>
										<td class="center">${title.tPic }</td>
										<td class="center">
											<c:choose>
												<c:when test="${title.tEnableState == 0  }">
													<button type="button" class="btn btn-warning  btn-circle" title="已停用"  ><i class="fa fa-times"></i></button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-success btn-circle" title="已启用" ><i class="fa fa-check"></i></button>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="center">
											<button class="btn btn-primary btn-sm editRow" title="点击编辑" data-toggle="modal" data-target="#newtitlemodal"><i class="fa fa-edit fa-fw"></i></button>
											<c:choose>
												<c:when test="${title.tEnableState == 0  }">
													<button class="btn btn-success btn-sm" title="点击启用" ><i class="fa fa-check fa-fw "></i></button>
												</c:when>
												<c:otherwise>
													<button class="btn btn-warning btn-sm" title="点击停用" ><i class="fa fa-times fa-fw "></i></button>
												</c:otherwise>
											</c:choose>
											<button class="btn btn-danger btn-sm" title="点击删除" ><i class="fa fa-trash-o fa-fw"></i></button>
											
										</td>
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

	<div class="modal fade in" id="newtitlemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">导航标题信息</h4>
					</div>
					<div class="modal-body">
						<form action="<%=basePath %>sys/newtitle" method="post" id="titleForm"  class="form-horizontal">
							<input type="hidden" name="tId" />
							<fieldset>
								<legend>编辑内容</legend>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 标题名称 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tName"  required data-bv-notempty-message="名称不能为空" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 标题编码 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tCode"  required data-bv-notempty-message="编码不能为空" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 标题顺序 </label>
									<div class="col-lg-7">
										<input type="number" class="form-control " name="tIndex"  required data-bv-notempty-message="顺序不能为空"
										pattern="^([1-9][0-9]{0,1}|100)$"  data-bv-message="请输入1至100以内的数字"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 标题图片 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tPic"  required data-bv-notempty-message="请上传图片" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">是否启用</label>
									<div class="col-lg-7">
										<div class="checkbox">
											<label>
												<input type="checkbox"  value="1" name="tEnableState" />启用
											</label>
										</div>
									</div>
								</div>
							</fieldset>
						</form>	
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" id="newtitlesub">提交</button>
					</div>
				</div>
		</div>
		
		
		


	<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/titlemanage.js"></script>

</body>


</html>