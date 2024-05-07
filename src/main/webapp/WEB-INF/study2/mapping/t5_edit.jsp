<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t5_edit.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원 정보 수정</h2>
	<hr/>
	<form name="myform" method="post" action="editOk.do5">
		<div>
			<input type="text" placeholder="수정할 아이디를 입력하세요" class="form-control mb-3" autofocus required />
			<input type="text" placeholder="수정할 내용을 입력하세요" class="form-control mb-3" autofocus required />
			<input type="submit" value="수정" class="btn btn-success" />
		</div>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>