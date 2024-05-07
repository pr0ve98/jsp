<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test5.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fCheck() {
			let flag = document.getElementById("choice").value;
			if(flag == 'join') {
				location.href = "join.do5";
			}
			else if(flag == 'edit') location.href = "edit.do5";
			else if(flag == 'delete') location.href = "delete.do5";
			else if(flag == 'search') location.href = "search.do5";
			else if(flag == 'list') location.href = "list.do5";
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>이곳은 test5.jsp(/WEB-INF/study2/mapping)</h2>
	<form name="myform" method="post">
		확인하고 싶은 옵션을 선택하세요.
		<select id="choice" onchange="fCheck()">
			<option>선택</option>
			<option value="join">회원가입</option>
			<option value="edit">자료수정</option>
			<option value="delete">자료삭제</option>
			<option value="search">자료검색</option>
			<option value="list">자료리스트</option>
		</select>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>