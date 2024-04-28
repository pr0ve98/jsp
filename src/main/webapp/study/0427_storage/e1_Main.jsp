<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	pageContext.setAttribute("mid", mid);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인화면</title>
	<script>
		'use strict';
		
		function logout() {
			let ans = confirm("로그아웃 하시겠습니까?");
			if(ans){
				alert("${mid}님 로그아웃 되었습니다.");
				location.href="<%=request.getContextPath()%>/study/0427_storage/e1_Login.jsp";
			}
		}
	</script>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원방</h2>
	<p>${mid}님 안녕하세요!</p>
	<p><input type="button" value="로그아웃" onclick="logout()" class="btn btn-warning" />
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>