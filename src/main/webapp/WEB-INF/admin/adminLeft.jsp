<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>adminLeft.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="text-center">
	<h5><a href="AdminMain.ad" target="_top">관리자메뉴</a></h5>
	<hr/>
	<p><a href="${ctp}/Main" target="_top">홈으로</a></p>
	<hr/>
	<div>
		<h5>방명록</h5>
		<div><a href="GuestList.ad" target="adminContent">방명록리스트</a></div>
	</div>
	<hr/>
	<div>
		<h5>게시판</h5>
		<div><a href="BorderList.bo" target="adminContent">게시판리스트</a></div>
	</div>
	<hr/>
	<div>
		<h5>회원관리</h5>
		<div><a href="MemberList.ad" target="adminContent">회원리스트</a></div>
		<div><a href="#" target="adminContent">신고리스트</a></div>
	</div>
	<hr/>
</div>
<p><br/></p>
</body>
</html>