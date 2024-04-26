<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 아래 명령이 T02VO vo = new T02VO()와 같음 -->
<jsp:useBean id="vo" class="study.j0426.T02VO" />
<!-- 서블릿에서의 getter()와 setter()는 JSP에서 getProperty, setProperty 이다. -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02_3Ok.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<%-- <jsp:setProperty property="name" name="vo" value="홍길동" /> 변수명이 같으면 value를 생략 가능 --%>
<%-- 	<jsp:setProperty property="name" name="vo" />
	<jsp:setProperty property="hakbun" name="vo" />
	<jsp:setProperty property="kor" name="vo" />
	<jsp:setProperty property="eng" name="vo" />
	<jsp:setProperty property="mat" name="vo" />
	<jsp:setProperty property="soc" name="vo" />
	<jsp:setProperty property="sci" name="vo" /> --%>
	<jsp:setProperty property="*" name="vo" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>넘어온 값들</h2>
	<hr/>
	<p>접속아이피: <jsp:getProperty property="hostIp" name="vo"/></p>
	<p>성명: <jsp:getProperty property="name" name="vo"/></p>
	<p>학번: <jsp:getProperty property="hakbun" name="vo"/></p>
	<p>국어: <jsp:getProperty property="kor" name="vo"/></p>
	<p>영어: <jsp:getProperty property="eng" name="vo"/></p>
	<p>수학: <jsp:getProperty property="mat" name="vo"/></p>
	<p>사회: <jsp:getProperty property="soc" name="vo"/></p>
	<p>과학: <jsp:getProperty property="sci" name="vo"/></p>
	<hr/>
	<p><a href="t02.jsp" class="btn btn-warning">돌아가기</a></p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>