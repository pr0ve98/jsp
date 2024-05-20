<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberMain.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function memberPhotoChange() {
			let fName = document.getElementById("file").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let maxSize = 1024 * 1024 * 10 // 기본단위는 Byte, 1024 * 1024 * 10 = 10MB 허용
			
			if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			
			let fileSize = document.getElementById("file").files[0].size;
			if(fileSize > maxSize){
				alert("업로드할 파일의 최대크기는 10MB입니다");
			}
			else if(ext != 'jpg' && ext != 'png' &&ext != 'gif' &&ext != 'zip' &&ext != 'hwp' &&ext != 'ppt' &&ext != 'pptx' &&ext != 'jpeg' &&ext != 'doc' &&ext != 'pdf' &&ext != 'xlsx'&&ext != 'txt'){
				alert("업로드 가능한 파일은 jpg/jpeg/png/gif/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt만 가능합니다");
			}
			else {
				$.ajax({
					url : "MemberPhotoChange.mem",
					type : "post",
				});
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원 전용방</h2>
	<hr/>
	<!-- 실시간 채팅방(DB) -->
	<img src="${ctp}/images/member/${mVo.photo}" width="200px"/>
	<hr/>
	<form name="myform" method="post">
		<label for="file">회원이미지 변경</label>
		<div class="form-group mt-2">
			<input type="file" name="fName" id="file">
			<input type="button" value="변경" onclick="memberPhotoChange()" class="btn btn-sm btn-warning"/>
		</div>
	</form>
	<hr/>
	<div>
		<p>현재 <font color="blue"><b>${sNickName}</b></font>(<font color="red">${sStrLevel}</font>)님이 로그인 중입니다.</p>
		<p>총 방문횟수 <b>${mVo.visitCnt}</b>회 / 오늘 방문횟수 <b>${mVo.todayCnt}</b>회</p>
		<p>총 보유 포인트 <b>${mVo.point}</b>점<c:if test="${mVo.todayCnt > 5}"> / (방문포인트 일일 최대한도 초과)</c:if></p>
	</div>
	<hr/>
	<div>
		<h5>활동 내역</h5>
		<p>방명록에 올린 글 수: <b>${guestCnt}</b>건</p>
		<p>게시판에 올린 글 수: _건</p>
		<p>자료실에 올린 글 수: _건</p>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>