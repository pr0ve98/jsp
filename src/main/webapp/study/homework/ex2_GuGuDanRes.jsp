<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ex2_GuGuDanRes.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<div class="text-center">
		<h2>결과 출력</h2>
		<hr>
		<c:forEach var="i" begin="${param.su1}" end="${param.su2}">
			<h4><b>☆☆☆☆☆ ${i}단 ☆☆☆☆☆</b></h4>
			<c:forEach var="j" begin="1" end="9">
				${i} * ${j} = ${i*j}<br/>
			</c:forEach>
			<hr/>
		</c:forEach>
		<p><a href="ex2_GuGuDan.jsp" class="btn btn-warning">돌아가기</a></p>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>