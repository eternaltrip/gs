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
			<!-- 会改变的页面 -->
			<div class="list_left">
				<div class="list_main">
					<ul>
						<c:forEach items="${pageinfo.list }" var="info">
							<li><a href="<%=basePath%>home/details.do?aId=${info.aId}">${info.aTitle }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="fenye">
						<c:choose>
							<c:when test="${pageinfo.hasPreviousPage == true }">
								<a  class="next" href="<%=basePath%>home/list.do?tId=${title.tId}&start=${ ( pageinfo.pageNum - 2 ) * pageinfo.pageSize}" ><</a>
							</c:when>
							<c:otherwise>
								<a  class="prov"><</a>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="x" begin="1" end="${pageinfo.pages}" step="1">
							<c:choose>
								<c:when test="${x == pageinfo.pageNum }">
									<a href="<%=basePath%>home/list.do?tId=${title.tId}&start=${(x - 1) * pageinfo.pageSize}" class="current_number">${x }</a>
								</c:when>
								<c:otherwise>
									<a href="<%=basePath%>home/list.do?tId=${title.tId}&start=${(x - 1) * pageinfo.pageSize}" >${x}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageinfo.hasNextPage == true}">
								<a href="<%=basePath%>home/list.do?tId=${title.tId}&start=${pageinfo.pageNum * pageinfo.pageSize}" class="next">></a>
							</c:when>
							<c:otherwise>
								<a  class="prov">></a>
							</c:otherwise>
						</c:choose>
						
					
					
					
					<a style="color:#000">共${pageinfo.pages }页</a>
				</div>
			</div>
			
</body>
</html>