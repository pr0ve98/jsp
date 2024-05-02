<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
/* 	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("name", name); */
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>view.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function deleteCheck() {
			let ans = confirm("정말로 탈퇴하실 건가요...? (T-T)");
			if(ans) {
				// 회원가입 시 아이디를 중복체크 했다는 가정 하에
				location.href ="${ctp}/database/LoginDelete?mid=${vo.mid}";
			}
		}
		function deleteCheck2() {
			let ans = confirm("정말로 삭제하실 건가요?");
			if(ans) {
				// 회원가입 시 아이디를 중복체크 했다는 가정 하에
				location.href ="${ctp}/database/LoginDelete?mid=${vo.mid}";
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원 상세 정보</h2>
	<form name="myform" method="post" action="${ctp}/database/UpdateOk">
		<p><input type="text" name="mid" value="${vo.mid}" placeholder="아이디를 입력하세요" class="form-control mt-3 mb-3" required disabled /></p>
		<%-- <p>${vo.mid}</p> --%>
		<p><input type="password" name="pwd" value="${vo.pwd}" placeholder="비밀번호를 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p><input type="text" name="name" value="${vo.name}" placeholder="성명을 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p><input type="text" name="age" value="${vo.age}"  placeholder="나이를 입력하세요" class="form-control mt-3 mb-3" required /></p>
		<p>
			<input type="radio" name="gender" value="남자" <c:if test="${vo.gender=='남자'}">checked</c:if> />남자&nbsp;
			<input type="radio" name="gender" value="여자" <c:if test="${vo.gender=='여자'}">checked</c:if> />여자
		</p>
		<p><input type="text" name="address" value="${vo.address}" placeholder="주소를 입력하세요" class="form-control mt-3 mb-3" /></p>
		<p>
			<input type="submit" value="수정" class="btn btn-primary mr-2" />
			<c:if test="${vo.mid==sMid}">
			<input type="button" onclick="deleteCheck()" value="탈퇴" class="btn btn-danger mr-2" />
			</c:if>
			<c:if test="${vo.mid!=sMid}">
			<input type="button" onclick="deleteCheck2()" value="삭제" class="btn btn-danger mr-2" />
			</c:if>
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/database/LoginList';" class="btn btn-warning" />
			<!-- <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-warning" /> -->
		</p>
		<input type="hidden" name="idx" value="${vo.idx}" />
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>