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
<title>新增新闻资讯</title>

<style type="text/css">
	/*webkit内核*/
.scroll_content::-webkit-scrollbar {
    width:0px;
    height:0px;
}
.scroll_content::-webkit-scrollbar-button    {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar-track     {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar-track-piece {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar-thumb{
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar-corner {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar-resizer  {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-webkit-scrollbar {
    width:10px;
    height:10px;
}
/*o内核*/
.scroll_content .-o-scrollbar{
    -moz-appearance: none !important;   
    background: rgba(0,255,0,0) !important;  
}
.scroll_content::-o-scrollbar-button    {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-o-scrollbar-track     {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-o-scrollbar-track-piece {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-o-scrollbar-thumb{
    background-color:rgba(0,0,0,0);
}
.scroll_content::-o-scrollbar-corner {
    background-color:rgba(0,0,0,0);
}
.scroll_content::-o-scrollbar-resizer  {
    background-color:rgba(0,0,0,0);
}
/*IE10,IE11,IE12*/
.scroll_content{
    -ms-scroll-chaining: chained;
    -ms-overflow-style: none;
    -ms-content-zooming: zoom;
    -ms-scroll-rails: none;
    -ms-content-zoom-limit-min: 100%;
    -ms-content-zoom-limit-max: 500%;
    -ms-scroll-snap-type: proximity;
    -ms-scroll-snap-points-x: snapList(100%, 200%, 300%, 400%, 500%);
    -ms-overflow-style: none;
    overflow: auto;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row" >
			<section>
				
				<div class="col-lg-2 " >
					<h5>&nbsp;&nbsp;(&nbsp;&nbsp;<span style="color: red;">*</span>&nbsp;&nbsp;表示必填项目) </h5>
				</div>
				<div class="col-lg-8  scroll_content" style="margin-top: 10px; max-height:530px; ">
					<form id="articleForm" method="post"
						<c:choose>
							<c:when test="${atricle.aId != null && atricle.aId != '' }">
								action="<%=basePath%>article/update.do" 
							</c:when><c:otherwise>
								action="<%=basePath%>article/new.do" 
							</c:otherwise>
						</c:choose>
					 class="form-horizontal">
					
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label">新闻资讯标题<span style="color: red;">*</span></label>
								<div class="col-lg-10">
									<input type="text" class="form-control" value="${atricle.aTitle }" name="aTitle" required data-bv-notempty-message="新闻资讯标题不能为空" />
								</div>
							</div>
							
							<div class="form-group ">
								<label class="col-lg-2 control-label">新闻资讯作者</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="aAuthor" value="${atricle.aAuthor }" />
								</div>
								
								<label class="col-lg-2 control-label">新闻资讯来源</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="aSources" value="${atricle.aSources }"  />
								</div>
							</div>
							
							<div class="form-group ">
								<label class="col-lg-2 control-label">所属导航</label>
								<div class="col-lg-4">
									<select class="form-control" name="titleId">
										<c:forEach items="${titles }" var="title" varStatus="item">
											<option value="${title.tId }" 
											<c:if test="${title.tId == atricle.titleId }">selected="selected"</c:if>
											>${title.tName }</option>
										</c:forEach>
									</select>
								</div>
								
								<label class="col-lg-2 control-label"> 封面图片 </label>
								<div class="col-lg-4">
									<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#fileModal">选择/查看图片</a>
									<input name="aPic" type="hidden" required />
								</div>
								
								
							</div>
							
							
							<div class="form-group ">
								<label class="col-lg-2 control-label">置顶状态</label>
								<div class="col-lg-4 control-label" style="text-align: left;">
									<c:choose>
										<c:when test="${1 == atricle.aEnableTop }">
											<label><input  type="radio" name="aEnableTop" value="1" checked="checked" />置顶</label>
											&nbsp;&nbsp;&nbsp;
											<label><input  type="radio" name="aEnableTop" value="0" />不置顶</label>
										</c:when>
										<c:otherwise>
											<label><input  type="radio" name="aEnableTop" value="1" />置顶</label>
											&nbsp;&nbsp;&nbsp;
											<label><input  type="radio" name="aEnableTop" value="0"  checked="checked"  />不置顶</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<label class="col-lg-2 control-label">显示状态</label>
								<div class="col-lg-4 control-label" style="text-align: left;">
										<c:choose>
											<c:when test="${1 == atricle.aEnableState }">
												<label><input  type="radio" name="aEnableState" value="1" checked="checked" />显示</label>
												&nbsp;&nbsp;&nbsp;
												<label><input  type="radio" name="aEnableState" value="0"  />隐藏</label>
											</c:when>
											<c:otherwise>
												<label><input  type="radio" name="aEnableState" value="1"  />显示</label>
												&nbsp;&nbsp;&nbsp;
												<label><input  type="radio" name="aEnableState" value="0" checked="checked" />隐藏</label>
											</c:otherwise>
										</c:choose>
								</div>
							</div>
							
							<div class="form-group ">
								<label class="col-lg-2 control-label">内容简介<span style="color: red;">*</span></label>
								<div class="col-lg-10">
									<textarea class="form-control"name="aContextSimple" required  data-bv-notempty-message="简介内容不能为空" 
									data-bv-stringlength="true"  data-bv-stringlength-max="300" data-bv-stringlength-message="简介内容不超过300字" 
									>${atricle.aContextSimple }</textarea>
								</div>
								
							</div>
							
							
							<div class="form-group ">
								<label class="col-lg-2 control-label">新闻资讯内容<span style="color: red;">*</span></label>
							</div>
							
							<div class="form-group ">
								<div class="col-lg-12  " >
									<div id="summernote" >${atricle.aContext }</div>
								</div>
							</div>
							<input name="aContext" id="aContext" type="hidden" required  data-bv-notempty-message="新闻资讯内容不能为空"/>
							<c:if test="${atricle.aId != null && atricle.aId != '' }">
								<input name="aId" value="${atricle.aId }" type="hidden"  />
							</c:if>
						</fieldset>
					</form>
				</div>
				
				<div class="col-lg-2 " style="padding-right: 50px;">
					<a class="btn btn-primary btn-sm pull-right " onclick="history.go(-1)" >返回</a>
				</div>
				
				
			</section>
		</div>
		<div class="row">
			<div class="form-group" style="margin-top: 10px;">
				<div class="col-lg-4 col-lg-offset-4">
					<button type="submit" class="btn btn-primary btn-block" id="submit">提交</button>
				</div>
			</div>
		</div>
		
		
		
	<div class="modal  fade in " id="fileModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"  >
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="messhead">封面图片<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button></h4>
				</div>
				<div class="modal-body " style="text-align: center;">
					<form action="<%=basePath %>sys/upload.do" method="post" id="picForm" enctype="multipart/form-data"  class="form-horizontal" >
						<input type="file" name="file" accept="image/*" />
						<c:choose>
							<c:when test="${atricle.aPic !='' && atricle.aPic != null }">
								<img  id="fmtp" src="<%=basePath %>${ atricle.aPic}" style="max-height: 200px; max-width: 320px;"/>
							</c:when>
							<c:otherwise>
								<img  id="fmtp" style="max-height: 200px; max-width: 320px;display: none;"/>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				<div class="modal-footer action" >
						<button type="submit" class="btn btn-primary "data-dismiss="modal" >确定</button>
				</div>
			</div>
		</div>
	</div>
		
		
	</div>
	<link rel="stylesheet"  href="<%=basePath%>statics/plugin/summernote-master/dist/summernote.css" >
	<script src="<%=basePath%>statics/plugin/summernote-master/dist/summernote.min.js"></script>
	<script src="<%=basePath%>statics/plugin/summernote-master/dist/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>view/js/sysmanage/articleEdit.js"></script>

</body>


</html>