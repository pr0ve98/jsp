<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
    Cookie[] cookies = request.getCookies();
    String saveMid = "";
    String check = "";
    for(int i=0; i<cookies.length; i++) {
        if(cookies[i].getName().equals("cMid")) {
        	saveMid = cookies[i].getValue();
        	check = "checked";
        }
    }
    pageContext.setAttribute("saveMid", saveMid);
    pageContext.setAttribute("check", check);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style type="text/css">
		.main{
			width:30%;
			margin: 0 auto;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container text-center">
	<h2>로그인</h2>
	<div class="main">
		<form name="myform" method="post" action="${ctp}/database/LoginOk">
			<p><input type="text" name="mid" value="${saveMid}" placeholder="아이디를 입력하세요" class="form-control mt-3 mb-3" required autofocus /></p>
			<p><input type="password" name="pwd" value="1234" placeholder="비밀번호를 입력하세요" class="form-control mt-3 mb-3" required /></p>
			<p>
				<input type="checkbox" name="idSave" value="저장" ${check} /> 아이디 저장&nbsp;&nbsp;&nbsp;
				<input type="submit" value="로그인" class="btn btn-primary" />
				<input type="button" value="회원가입" onclick="location.href='join.jsp';" class="btn btn-info" />
			</p>
		</form>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>