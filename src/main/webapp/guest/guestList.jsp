<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %> <!-- 줄띄움 편법 -->
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>guestList.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
		#guestBtn {display:flex; justify-content: space-between;}
	</style>
	<script>
		'use strict';
		
		function delCheck(idx) {
			let ans = confirm("현재 방명록 글을 삭제하시겠습니까?");
			if(ans) {
				location.href = '${ctp}/GuestDelete?idx='+idx;
				return false;
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">방 명 록 리 스 트</h2>
	<div id="guestBtn"><a href="#" class="btn-sm btn-primary">관리자</a>
	<a href="${ctp}/guest/guestInput.jsp" class="btn-sm btn-success">글쓰기</a></div>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>번호: ${vo.idx}
				<c:if test="${sMid == 'admin'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm ml-2">삭제</a></c:if>
				</td>
				<td class="text-right">아이피: ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${vo.name}</td>
				<th>작성시간</th>
				<td>${vo.visitDate}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">${vo.homePage}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${fn:replace(vo.content, newLine, "<br/>")}</td>
			</tr>
		</table>
		<br/>
	</c:forEach>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>