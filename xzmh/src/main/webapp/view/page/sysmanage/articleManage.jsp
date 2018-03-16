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
<title>新闻资讯管理</title>
<style type="text/css">
.table>tbody>tr>td{  
	text-align:center;  
} 
</style>
 
 
 
 

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						新闻资讯信息
						<div class="pull-right">
							<div class="btn-group">
								<a type="button" href="<%=basePath%>article/newpage.do" class="btn btn-primary btn-xs" style="cursor: pointer;">
									<i class="fa fa-plus fa-fw"></i>新增
								</a>
							</div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<form role="form" action="<%=basePath%>article/query.do" method="post" id="queryForm">
							<div class="form-group  col-xs-2">
								<label class="control-label ">导航</label>
								<select class="form-control" name="titleId">
									<option value="-1">全部导航</option>
									<c:forEach items="${titles }" var="title" varStatus="item">
										<option value="${title.tId }">${title.tName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-2">
								<label class="control-label ">新闻标题</label>
								<input type="text" class="form-control" name="aTitle" placeholder="新闻标题关键字">
							</div>
							
							<div class="form-group col-xs-2">
								<label class="control-label ">头条状态</label>
								<select class="form-control" name="aEnableHeadline">
									<option value="-1">全部</option>
									<option value="1">头条</option>
									<option value="0">非头条</option>
								</select>
							</div>
							
							<div class="form-group col-xs-2">
								<label class="control-label ">置顶状态</label>
								<select class="form-control" name="aEnableTop">
									<option value="-1">全部</option>
									<option value="1">置顶</option>
									<option value="0">非置顶</option>
								</select>
							</div>
							<div class="form-group col-xs-2">
								<label class="control-label ">显示状态</label>
								<select class="form-control" name="aEnableState">
									<option value="-1">全部</option>
									<option value="1">显示</option>
									<option value="0">隐藏</option>
								</select>
							</div>
							<div class="form-group col-xs-2 pull-right " style="padding-top: 25px;text-align: right;">
								<a class="btn btn-primary btn-sm "  style="margin-left: 10px;" id="query" >查询</a>
								<a class="btn btn-default btn-sm " style="margin-left: 10px;" id="clear" >清空</a>
							</div>
						</form>

						<table  class="table table-striped table-bordered table-hover" id="articleinfoList">
							<thead>
								<tr>
									<th style="width:7%;text-align: center;max-width: 88px;">序号</th>
									<th style="width: 20%;text-align: center;">新闻标题及状态</th>
									<th style="width: 10%;text-align: center;">所属导航</th>
									<th style="width: 10%;text-align: center;">置顶状态</th>
									<th style="width: 10%;text-align: center;">显示状态</th>
									<th style="width: 10%;text-align: center;">封面图片</th>
									<th style="width: 10%;text-align: center;">操作时间</th>
									<th style="width: 20%;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="rewardBody" style="max-height: 400px;overflow-x: hidden;overflow-y: scroll;"></tbody>
							
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<form action="<%=basePath%>article/newpage.do" type="post" id="editTopage">
			<input type="hidden" name="aId" id="editAid"/>
		</form>
	</div>



	<div class="modal fade in" id="headlineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">头条设置</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-info "><span id="titleName" style="color: red;font-size: 20px;"></span></div>
						<form id="headlineForm" method="post" class="form-horizontal bv-form form-group" action="<%=basePath%>article/update.do" novalidate="novalidate">
							<div class="form-group">
								<label class="col-lg-3 control-label">头条状态</label>
								<div class="col-lg-5">
									<div class="radio">
										<label> 
											<input type="radio" name="aEnableHeadline"  value="0" id="headlineoff" >取消头条
										</label>
									</div>
									<div class="radio">
										<label>
											<input type="radio" name="aEnableHeadline"  value="1" id="headlineon" checked="checked">设置头条
										</label>
									</div>
								</div>
							</div>
							<div id="headline">
								<div class="form-group has-feedback">
									<label class="col-lg-3 control-label">头条顺序</label>
									<div class="col-lg-5">
										<input type="number" class="form-control" name="aHeadlineSort" required data-bv-notempty-message="顺序不能为空"
										min=1 max=10  data-bv-message="请输入1至10以内的数字" data-bv-greaterThan-message="请输入1至10以内的数字" data-bv-lessThan-message="请输入1至10以内的数字" >
									</div>
								</div>
							</div>
							
							<input type="hidden" name="aId" required />
						</form>
					</div>
					
					<div class="modal-footer action" style="text-align: center;">
						<button type="button" class="btn btn-default col-xs-3 col-xs-offset-3" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary col-xs-3" id="headlinecomfirm"  >确定</button>
					</div>
				</div>
		</div>
	</div>


	<div class="modal  fade in " id="actionmodal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"  >
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="messhead">提示(删除后将无法恢复)</h4>
				</div>
				<div class="modal-body alert alert-info"id="actionInfo" style="text-align: center;font-size: 16px; margin-bottom: 0px;" >
				</div>
				<div class="modal-footer action" style="text-align: center;">
						<button type="button" class="btn btn-default col-xs-3 col-xs-offset-3" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary col-xs-3" id="actioncomfirm"  >确定</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal  fade in " id="fmtpshowModal" tabindex="-1" role="dialog" aria-hidden="true"  >
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">封面图片<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
					
				</div>
				<div class="modal-body" style="text-align: center;" >
							<img  id="fmtpshow" style="max-height: 300px; max-width: 560px;"/>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/articleManage.js"></script>

</body>


</html>