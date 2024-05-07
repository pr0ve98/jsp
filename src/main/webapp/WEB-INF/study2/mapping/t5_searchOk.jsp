<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t5_search.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>${mid}님의 회원 정보</h2>
	<p>정보들...</p>
	<p>정보들...</p>
	<p>정보들...</p>
	<a href="test5.do5" class="btn btn-warning">돌아가기</a>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>