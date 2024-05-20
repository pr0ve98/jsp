<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload4.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fCheck() {
			//let fName = document.getElementById("file").value;
			//let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let fName = document.getElementById("file").value;
			let ext = "";
			let fileSize = 0;
			let maxSize = 1024 * 1024 * 10 // 기본단위는 Byte, 1024 * 1024 * 10 = 10MB 허용
			
			if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			
			let fileLength = document.getElementById("file").files.length;	// 선택한 파일의 개수
			
			for(let i=0; i<fileLength; i++){
				fName = document.getElementById("file").files[i].name;	// 선택된 1개의 파일 이름 가져오기
				ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				fileSize = document.getElementById("file").files[i].size;
				else if(ext != 'jpg' && ext != 'png' &&ext != 'gif' &&ext != 'zip' &&ext != 'hwp' &&ext != 'ppt' &&ext != 'pptx' &&ext != 'jpeg' &&ext != 'doc' &&ext != 'pdf' &&ext != 'xlsx'&&ext != 'txt'){
					alert("업로드 가능한 파일은 jpg/jpeg/png/gif/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt만 가능합니다");
				}
			}
			
			if(fileSize > maxSize){
				alert("업로드할 파일의 최대크기는 10MB입니다");
			}
			else {
				alert("파일 전송!");
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>파일 업로드 연습(멀티파일처리)</h2>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(http://www.servlets.com/cos/)</div>
	<hr/>
	<form name="myform" method="post" action="FileUpload4Ok.st" enctype="multipart/form-data">
		파일명: 
		<div>
			<input type="file" name="fName" id="file" multiple class="form-control-file border mb-2"/>
		</div>
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
		<input type="hidden" name="nickName" value="${sNickName}" />
	</form>
	<hr/>
	<img id="demoImg" width="200px"/>
	<hr/>
	<div><a href="FileDownload.st" class="btn btn-primary form-control">다운로드폴더로 이동하기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>