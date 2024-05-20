<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileDownload.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fileDelete(fileName) {
			$.ajax({
				url : "FileDelete.st",
				type : "post",
				data : {fileName : fileName},
				success : function(res) {
					if(res != "0"){
						alert("삭제완료!");
						location.reload();
					}
					else alert("삭제 실패!");
				},
				error : function() {
					alert("오류남 ㅋㅋ");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>저장된 파일 정보</h2>
	<hr/>
	<c:forEach var="file" items="${files}" varStatus="st">
		${st.count}. <a href="${ctp}/images/pdsTest/${file}" download="${file}">${file}</a>
		<input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger btn-sm" />
		<br/>
		<c:set var="fNameArr" value="${fn:split(file, '.')}" />
		<c:set var="ext" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}" />
		<font color="blue">
			<c:if test="${ext == 'zip'}">압축파일</c:if>
			<c:if test="${ext == 'ppt' || ext == 'pptx'}">파워포인트파일</c:if>
			<c:if test="${ext == 'xls' || ext == 'xlsx'}">엑셀파일</c:if>
			<c:if test="${ext == 'pdf'}">PDF파일</c:if>
			<c:if test="${ext == 'txt'}">텍스트파일</c:if>
		</font>
		<c:if test="${ext == 'jpg' || ext == 'png' || ext == 'gif' || ext == 'jpeg'}">
			<img src="${ctp}/images/pdsTest/${file}" width="200px"/><br/>
		</c:if>
		<br/><br/>
	</c:forEach>
	<hr/>
	<p><input type="button" value="돌아가기" onclick="location.href='FileUpload4.st';" class="btn btn-warning"/></p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>