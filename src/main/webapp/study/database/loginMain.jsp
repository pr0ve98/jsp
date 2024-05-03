<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>loginMain.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
	
		function nameSearch() {
			let name = document.getElementById("name").value;
			
			if(name.trim() == "") {
				alert("검색할 성명을 입력하세요.");
				document.getElementById("name").focus();
				return false;
			}
			
			location.href = "${ctp}/database/LoginSearch?name="+name;
		}
		
		function loginList() {
			location.href = "${ctp}/study/database/LoginList";
		}
		
		function optionChange() {
			let val = document.getElementById("title").value;
			if(val != null) {
				location.href = "${ctp}/database/LoginListSort?val="+val;
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<c:choose>
		<c:when test="${param.val == 'idx'}"><c:set var="sort" value="(가입 오름차순 정렬)"></c:set></c:when>
		<c:when test="${param.val == 'idxDesc'}"><c:set var="sort" value="(가입 내림차순 정렬)"></c:set></c:when>
		<c:when test="${param.val == 'name'}"><c:set var="sort" value="(성명 오름차순 정렬)"></c:set></c:when>
		<c:when test="${param.val == 'nameDesc'}"><c:set var="sort" value="(성명 내림차순 정렬)"></c:set></c:when>
		<c:when test="${param.val == 'age'}"><c:set var="sort" value="(나이 오름차순 정렬)"></c:set></c:when>
		<c:when test="${param.val == 'ageDesc'}"><c:set var="sort" value="(나이 내림차순 정렬)"></c:set></c:when>
	</c:choose>
	<h2 class="text-center">회 원 메 인 방 ${sort}</h2>
	<hr/>
	<div>
		<select id="title" onchange="optionChange()">
			<option value=null>선택</option>
			<option value="idx">가입 오름차순</option>
			<option value="idxDesc">가입 내림차순</option>
			<option value="name">성명 오름차순</option>
			<option value="nameDesc">성명 내림차순</option>
			<option value="age">나이 오름차순</option>
			<option value="ageDesc">나이 내림차순</option>
		</select>
		<input type="button" value="기본정렬" onclick="loginList()" class="btn btn-success btn-sm mb-2" />
	</div>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>성명</th>
			<th>나이</th>
			<th>성별</th>
			<th>주소</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.mid}</td>
				<td><a href="${ctp}/study/database/LoginView?idx=${vo.idx}">${vo.name}</a></td>
				<td>${vo.age}</td>
				<td>${vo.gender}</td>
				<td>${vo.address}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<hr/>
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">성 명</span></div>
		<input type="text" name="name" id="name" class="form-control" />
		<button type="button" onclick="nameSearch()" class="input-group-append btn btn-warning">개별조회</button>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>