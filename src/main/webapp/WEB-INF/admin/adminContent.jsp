<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>adminContent.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<h3>관리자 메인화면</h3>
	<hr/>
	<!--
		방명록은 최근 1주일 안에 작성된 글의 개수를 보여준다.
		게시판은...
		신규 회원 건수
		탈퇴신청회원 건수
	-->
	<p>방명록 새글: ???</p>
	<p>게시글 새글: ???</p>
	<p>신고글(최근 1주일): ???건</p>
	<p>신규회원 건수: <a href="MemberList.ad?level=1"><b>${mCount}</b></a>건</p>
	<p>탈퇴신청회원 건수: <a href="MemberList.ad?level=99"><font color="red"><b>${m99Count}</b></font></a>건</p>
</div>
<p><br/></p>
</body>
</html>