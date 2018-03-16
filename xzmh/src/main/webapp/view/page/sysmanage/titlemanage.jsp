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
<title>导航管理</title>
</head>
<body>
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						导航信息
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" id="newTitleBtn" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newtitlemodal">
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
									<th style="width: 20%;text-align: center;">导航名称</th>
									<th style="width: 10%;text-align: center;">导航顺序</th>
									<th style="width: 10%;text-align: center;">是否链接</th>
									<th style="width: 10%;text-align: center;">启用状态</th>
									<th style="width: 20%;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody style="text-align: center;" id="titleTables">
								<c:forEach items="${list }" var="title" varStatus="item">
										<tr class="
											<c:if test="${item.index%2 == 0 }">
												odd gradeX
											</c:if>
											<c:if test="${item.index%2 != 0 }">
												even gradeC
											</c:if>" tid="${title.tId }" tname="${title.tName }">
										<td class="center">${item.index + 1}</td>
										<td class="center">${title.tName }</td>
										<td class="center">${title.tIndex }</td>
										<td class="center">
											<c:if test="${title.isUrl == 1  }">
												<a title="${title.tUrl }"><i class= "fa fa-link fa-aw"></i>链接</a>
											</c:if>
											<c:if test="${title.isUrl == 0  }">
												<span class="label label-default " style="padding: 3px;margin: 3px;">否</span>
											</c:if>
										</td>
										<td class="center">
											<c:choose>
												<c:when test="${title.tEnableState == 0  }">
													<span class="label label-warning " style="padding: 3px;margin: 3px;">未启用</span>
												</c:when>
												<c:otherwise>
													<span class="label label-success " style="padding: 3px;">已启用</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="center">
											<button class="btn btn-primary btn-xs editRow"  data-toggle="modal" data-target="#newtitlemodal"><i class="fa fa-edit fa-fw"></i>编辑</button>
											<c:choose>
												<c:when test="${title.tEnableState == 0  }">
													<button class="btn btn-success btn-xs changestate"  changeType="on" ><i class="fa fa-check fa-fw "></i>启用</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn-warning btn-xs changestate"   changeType="off"  ><i class="fa fa-times fa-fw "></i>停用</button>
												</c:otherwise>
											</c:choose>
											<button class="btn btn-danger btn-xs delete changestate"    changeType="del"  ><i class="fa fa-trash-o fa-fw"></i>删除</button>
											
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

	<div class="modal fade in" id="newtitlemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">导航信息<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
					</div>
					<div class="modal-body">
						<form action="<%=basePath %>title/addOrUpdate.do" method="post" id="titleForm"  class="form-horizontal">
							
							<fieldset>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 导航名称 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tName"  required data-bv-notempty-message="名称不能为空" />
									</div>
								</div>
							<%-- 	<div class="form-group">
									<label class="col-lg-3 control-label"> 导航编码 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tCode"  required data-bv-notempty-message="导航编码不能为空" data-bv-message="导航编码不能为空"
											pattern="^[a-zA-Z]+$" data-bv-regexp-message="导航编码由4-8位字母组成" data-bv-stringlength="true" data-bv-stringlength-min="4" 
											data-bv-stringlength-max="8" data-bv-stringlength-message="导航由4-8位字母组成" 
											data-bv-threshold="4" data-bv-remote-delay="1000"  data-bv-remote="true" data-bv-remote-url="<%=basePath %>title/titleNameCheck" 
										 />
									</div>
								</div> --%>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 导航顺序 </label>
									<div class="col-lg-7">
										<input type="number" class="form-control " name="tIndex"  required data-bv-notempty-message="顺序不能为空"
										pattern="^([1-9][0-9]{0,1}|100)$"  data-bv-message="请输入1至100以内的数字"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">是否链接</label>
									<div class="col-lg-3">
										<div class="radio">
											<label>
												<input type="radio"  value="0" name="isUrl"  checked="checked" />否
											</label>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<label>
												<input type="radio"  value="1" name="isUrl" />是
											</label>
										</div>
									</div>
								</div>
								
								<div class="form-group" id="urlDiv" >
									<label class="col-lg-3 control-label">链接地址</label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="tUrl" type="url" placeholder="http://www.xxx.com"
										pattern="(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]" required 
										data-bv-notempty-message="请输入有效的网络地址" data-bv-regexp-message="请输入有效的网络地址"  disabled="disabled"/>
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
								<div class="form-group">
									<label class="col-lg-3 control-label"> 导航图片 </label>
									<div class="col-lg-7">
										<a class="btn btn-primary btn-sm" id="choosePic">选择图片</a>
									</div>
								</div>
								
								<input type="hidden" name="tId" />
								<input type="hidden" name="tPic" />
							</fieldset>
						</form>
						
						<form action="<%=basePath %>sys/upload.do" method="post" id="picForm" enctype="multipart/form-data"  class="form-horizontal" >
							<input type="file" name="file" accept="image/*" style="display: none;" />
							<div class="form-group" >
								<label class="col-lg-3 control-label"> 图片展示 </label>
								<div class="col-lg-7">
									<img alt="导航图片"  id="image" style="max-height: 200px; max-width: 320px;display: none;"/>
								</div>
							</div>
						</form>
						
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default col-xs-3 col-xs-offset-3" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary col-xs-3" id="newtitlesub">提交</button>
					</div>
				</div>
		</div>
	</div>
	
	<div class="modal  fade in " id="OnOffDelModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"  >
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="messhead">提示</h4>
				</div>
				<div class="modal-body alert alert-info"id="OnOffDelInfo" style="text-align: center;font-size: 16px; margin-bottom: 0px;" >
				</div>
				<div class="modal-footer">
						<button type="button" class="btn btn-default col-xs-3 col-xs-offset-3" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary col-xs-3" id="OnOffDelcomfirm" >确定</button>
				</div>
			</div>
		</div>
	</div>
	
	
		
		
		


	<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/titlemanage.js"></script>

</body>


</html>