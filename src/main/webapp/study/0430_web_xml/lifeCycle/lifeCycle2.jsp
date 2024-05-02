<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/j0430/LifeCycle2Ok">
		<p><input type="text" name="title" value="Servlet 메소드 생명주기2" class="form-control mt-3 mb-3" required autofocus /></p>
		<p><textarea name="content" rows="6" class="form-control">서블릿 메소드 생명주기2입니다.</textarea></p>
		<p>
			<input type="submit" value="전송" class="btn btn-primary" />
		</p>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>