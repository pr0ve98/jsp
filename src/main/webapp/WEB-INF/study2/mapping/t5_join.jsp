<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t5_join.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원가입</h2>
	<hr/>
	<form name="myform" method="post" action="joinOk.do5">
		<div>
			<input type="text" name="mid" placeholder="아이디를 입력하세요" class="form-control mb-3" autofocus required />
			<input type="password" name="pwd"  placeholder="비밀번호를 입력하세요" class="form-control mb-3" required />
			<input type="text" name="name"  placeholder="성명을 입력하세요" class="form-control mb-3" required />
			<input type="number" name="age"  placeholder="나이을 입력하세요" class="form-control mb-3" required />
			<input type="text" name="address"  placeholder="주소를 입력하세요" class="form-control mb-3" required />
			<input type="submit" value="가입하기" class="btn btn-success" />
		</div>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>