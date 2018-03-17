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
<html>
<head>
</head>
<body>

	<div class="list_left" style="height: auto;min-height: 570px;">
		<div class="detil_top">
			<p class="detil_tit">${info.aTitle }</p>
			<p class="detil_tit_con">更新时间：<fmt:formatDate value="${info.updateTime }" pattern="yyyy-MM-dd HH:MM"/>&nbsp;&nbsp;&nbsp;&nbsp;来源：${info.aSources}</p>
		</div>
		<c:if test="${info.aPic !=null && info.aPic !='' }">
			<div class="detil_img" style="max-height: 300px;max-width: 850px;">
				<img src="<%=basePath %>${info.aPic}" style="max-height: 240px;max-width: 850px;"/>
			</div>
		</c:if>
			<p>${info.aContext }</p>
			
	</div>
	
</body>
</html>