<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>complaintList.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function complaintCheck(part, partIdx, complaint) {
			$.ajax({
				url : "ComplaintCheck.ad",
				type : "get",
				data : {part:part, partIdx:partIdx, complaint:complaint},
				success : function() {
					location.reload();
				},
				error : function() {
					alert("에러남");
				}
			});
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="text-center">신 고 리 스 트</h2>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>신고자</th>
			<th>신고사유</th>
			<th>신고날짜</th>
			<th>표시여부</th>
		</tr>
		<c:set var="complaintCnt" value="${complaintCnt}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${complaintCnt}</td>
				<td>${vo.part}</td>
				<td>${vo.title}</td>
				<td>${vo.nickName}</td>
				<td>${vo.cpMid}</td>
				<td>${vo.cpContent}</td>
				<td>${vo.cpDate}</td>
				<td>
					<a href="javascript:complaintCheck('${vo.part}',${vo.partIdx}, '${vo.complaint}')">${vo.complaint == 'NO' ? '표시중' : '표시안함'}</a>
				</td>
			</tr>
			<c:set var="complaintCnt" value="${complaintCnt-1}"/>
		</c:forEach>
		<tr><td colspan="8" class="p-0 m-0"></td></tr>
	</table>
</div>
<p><br/></p>
</body>
</html>