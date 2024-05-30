<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page isErrorPage="true" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>errorMessage.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>현재 공사중입니다.(404)</h2>
	<p>빠른 시일내로 문제를 해결하도록 하겠습니다.</p>
	<div><img src="${ctp}/images/114.jpg" width="400px"/></div>
	<hr/>
	<div><a href="${ctp}/" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>