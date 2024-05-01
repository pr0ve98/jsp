<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>join.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원가입</h2>
	<form name="myform" method="post" action="${ctp}/database/JoinOk">
		<p><input type="text" name="mid" placeholder="아이디를 입력하세요" class="form-control mt-3 mb-3" required autofocus /></p>
		<p><input type="password" name="pwd" value="1234" placeholder="비밀번호를 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p><input type="text" name="name"  placeholder="성명을 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p><input type="text" name="age" value="20"  placeholder="나이를 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p>
			<input type="radio" name="gender" value="남자" />남자&nbsp;
			<input type="radio" name="gender" value="여자" checked />여자
		</p>
		<p><input type="text" name="address" placeholder="주소를 입력하세요" class="form-control mt-3 mb-3" /></p>
		<p>
			<input type="submit" value="가입하기" class="btn btn-primary mr-2" />
			<input type="reset" value="다시입력" class="btn btn-danger mr-2" />
			<input type="button" value="돌아가기" onclick="location.href='login.jsp';" class="btn btn-warning" />
		</p>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>