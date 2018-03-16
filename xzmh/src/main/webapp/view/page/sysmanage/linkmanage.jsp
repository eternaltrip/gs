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
<title>友情链接管理</title>
</head>
<body>
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						友情链接信息
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" id="newlinkBtn" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newlinkmodal">
									<i class="fa fa-plus fa-fw"></i>新增
								</button>
							</div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="linkinfoList">
							<thead>
								<tr>
									<th style="width: 10%;text-align: center;">序号</th>
									<th style="width: 20%;text-align: center;">链接名称</th>
									<th style="width: 10%;text-align: center;">链接顺序</th>
									<th style="width: 10%;text-align: center;">链接地址</th>
									<th style="width: 10%;text-align: center;">启用状态</th>
									<th style="width: 20%;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody style="text-align: center;" id="linkTables">
								<c:forEach items="${list }" var="link" varStatus="item" >
										<tr class="
											<c:if test="${item.index%2 == 0 }">
												odd gradeX
											</c:if>
											<c:if test="${item.index%2 != 0 }">
												even gradeC
											</c:if>" lid="${link.lid }" linkname="${link.linkname }">
										<td class="center">${item.index + 1}</td>
										<td class="center">${link.linkname }</td>
										<td class="center">${link.linksort }</td>
										<td class="center">
											${link.linkaddr }
										</td>
										<td class="center">
											<c:choose>
												<c:when test="${link.linkstate == 0  }">
													<span class="label label-warning " style="padding: 3px;margin: 3px;">未启用</span>
												</c:when>
												<c:otherwise>
													<span class="label label-success " style="padding: 3px;">已启用</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="center">
											<button class="btn btn-primary btn-xs editRow"  data-toggle="modal" data-target="#newlinkmodal"><i class="fa fa-edit fa-fw"></i>编辑</button>
											<c:choose>
												<c:when test="${link.linkstate == 0  }">
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

	<div class="modal fade in" id="newlinkmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" >
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">友情链接信息<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
					</div>
					<div class="modal-body">
						<form action="<%=basePath %>link/addOrUpdate.do" method="post" id="linkForm"  class="form-horizontal">
							
							<fieldset>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 链接名称 </label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="linkname"  required data-bv-notempty-message="名称不能为空" />
									</div>
								</div>
								
								<div class="form-group" >
									<label class="col-lg-3 control-label">链接地址</label>
									<div class="col-lg-7">
										<input type="text" class="form-control " name="linkaddr" type="url" placeholder="http://www.xxx.com"
										pattern="((https?|ftp|file)://)|(www)[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]" required 
										data-bv-notempty-message="请输入有效的网络地址" data-bv-regexp-message="请输入有效的网络地址" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label"> 链接顺序 </label>
									<div class="col-lg-7">
										<input type="number" class="form-control " name="linksort"  required data-bv-notempty-message="顺序不能为空"
										pattern="^([1-9][0-9]{0,1}|100)$"  data-bv-message="请输入1至100以内的数字"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">是否启用</label>
									<div class="col-lg-7">
										<div class="checkbox">
											<label>
												<input type="radio"  value="1" name="linkstate" checked="checked" />启用
											</label>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<label>
												<input type="radio"  value="0" name="linkstate" />隐藏
											</label>
										</div>
									</div>
								</div>
								
								<input type="hidden" name="lid" />
							</fieldset>
						</form>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default col-xs-3 col-xs-offset-3" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary col-xs-3" id="newlinksub">提交</button>
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
	
	
		
		
		


	<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/linkmanage.js"></script>

</body>


</html>