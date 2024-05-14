<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %> <!-- 엔터키에 대한 처리 -->
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardContent.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function boardDelete() {
			let ans = confirm("현재 게시글을 삭제하시겠습니까?");
			if(ans) location.href="BoardDelete.bo?idx=${vo.idx}";
		}
		
		// 좋아요 처리(중복허용)
		function goodCheck() {
			$.ajax({
				url : "BoardGoodCheck.bo",
				type : "post",
				data : {idx : ${vo.idx}},
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("오류남");
				}
			});
		}
		
		// 좋아요 처리(중복불허)
		function goodCheck2() {
			$.ajax({
				url : "BoardGoodCheck2.bo",
				type : "post",
				data : {idx : ${vo.idx}},
				success : function(res) {
					if(res != "0") location.reload();
					else alert("이미 좋아요 버튼을 클릭하셨습니다");
				},
				error : function() {
					alert("오류남");
				}
			});
		}
		
		// 개추 처리(중복허용)
		function goodCheckPlus() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : {
					idx : ${vo.idx},
					goodCnt : +1	
				},
				success : function(res) {
					location.reload();
				},
				error : function() {
					alert("오류남");
				}
			});
		}
		
		// 비추 처리(중복허용)
		function goodCheckMinus() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : {
					idx : ${vo.idx},
					goodCnt : -1	
				},
				success : function(res) {
					location.reload();
				},
				error : function() {
					alert("오류남");
				}
			});
		}
	</script>
	<style>
		a:link {
	  	color : black;
		}
		a:visited {
		  color : black;
		}
		a:hover {
		  color : black;
		  text-decoration-line: none;
		}
		a:active {
		  color : black;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center mb-4">글 내 용 보 기</h2>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>작성시간</th>
			<td>${fn:substring(vo.wDate, 0, 16)}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.readNum}</td>
			<th>작성아이피</th>
			<td>${vo.hostIp}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				${vo.title} (<a href="javascript:goodCheck()">❤</a> ${vo.good})&nbsp;&nbsp;
				<a href="javascript:goodCheckPlus()">👍</a> &nbsp;&nbsp;
				<a href="javascript:goodCheckMinus()">👎</a> &nbsp;&nbsp;
				(<a href="javascript:goodCheck2()">💜</a> ${vo.good})
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
		</tr>
		<tr>
			<td colspan="4">
				<div class="row">
					<div class="col">
						<input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${param.pag}&pageSize=${param.pageSize}';" class="btn btn-warning"/>
					</div>
					<c:if test="${sNickName == vo.nickName || sLevel == 0}">
						<div class="col text-right">
							<input type="button" value="수정" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${param.pag}&pageSize=${param.pageSize}';" class="btn btn-success"/>
							<input type="button" value="삭제" onclick="boardDelete()" class="btn btn-danger"/>
						</div>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
	<hr/>
	<!-- 이전글 다음글 출력하기 -->
	<table class="table table-borderless">
		<c:if test="${!empty nextVo.title}">
		<tr>
			<td>☝ 다음글&nbsp;&nbsp;<a href="BoardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}">${nextVo.title}</a></td>
			<td class="text-right">${nextVo.nickName}</td>
			<td class="text-right">${fn:substring(nextVo.wDate, 0, 10)}</td>
		</tr>
		</c:if>
		<c:if test="${!empty preVo.title}">
		<tr>
			<td>👇 이전글&nbsp;&nbsp;<a href="BoardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}">${preVo.title}</a></td>
			<td class="text-right">${preVo.nickName}</td>
			<td class="text-right" style="width:120px">${fn:substring(preVo.wDate, 0, 10)}</td>
		</tr>
		</c:if>
	</table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>