<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardUpdate.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">게 시 글 수 정</h2>
	<form name="myform" method="post" action="BoardUpdateOk.bo">
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly /></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="title" id="title" value="${vo.title}" class="form-control" required autofocus /></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea name="content" id="content" rows=6 class="form-control" required>${vo.content}</textarea></td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td>
					<input type="radio" name="openSw" id="openSw1" value="OK" ${vo.openSw == 'OK' ? 'checked' : ''} />공개 &nbsp;&nbsp;
					<input type="radio" name="openSw" id="openSw2" value="NO" ${vo.openSw == 'NO' ? 'checked' : ''} />비공개
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="수정하기" class="btn btn-primary mr-2" />
					<input type="reset" value="다시입력" class="btn btn-secondary mr-2" />
					<input type="button" value="돌아가기" onclick="location.href='BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning" />
				</td>
			</tr>
		</table>
		<!-- <input type="hidden" name="mid" value="${sMid}"/> -->
		<input type="hidden" name="idx" value="${vo.idx}"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>