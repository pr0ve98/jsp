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
		
	    // 전체선택
	    function allCheck() {
	      for(let i=0; i<myform.fileFlag.length; i++) {
	        myform.fileFlag[i].checked = true;
	      }
	    }

	    // 전체취소
	    function allReset() {
	      for(let i=0; i<myform.fileFlag.length; i++) {
	        myform.fileFlag[i].checked = false;
	      }
	    }

	    // 선택반전
	    function reverseCheck() {
	      for(let i=0; i<myform.fileFlag.length; i++) {
	        myform.fileFlag[i].checked = !myform.fileFlag[i].checked;
	      }
	    }
	    
	    // 선택항목 삭제처리
	    function selectFileDelete() {
	  		let selectFileArray = '';
	    	
	      	for(let i=0; i<myform.fileFlag.length; i++) {
	        	if(myform.fileFlag[i].checked) selectFileArray += myform.fileFlag[i].value + "/";
	     	 }
	    	if(selectFileArray == '') {
	    		alert("삭제할 파일을 1개 이상 선택하세요");
	    		return false;
	    	}
	    	
	    	let ans = confirm("선택된 파일을 삭제하시겠습니까?");
	    	if(!ans) return false;
	    	
	    	selectFileArray = selectFileArray.substring(0,selectFileArray.lastIndexOf("/"));
	      	let query = {
	    		  selectFileArray : selectFileArray
	      	}
	      
	      	$.ajax({
	    	  	url  : "FileDeleteCheck.st",
	    	  	type : "post",
	    	  	data : query,
	    	  	success:function(res) {
	    		  	if(res != "0") { 
	    			  	alert("선택한 항목들을 삭제하셨습니다.");
	    			  	location.reload();
	    		  	}
	    		  	else alert("삭제 실패~");
	    	  	},
	    	  	error : function() {
	    		  	alert("전송 실패~~");
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
	<div class="input-group">
	  	<input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1"/>
	  	<input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm mr-1"/>
	  	<input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-info btn-sm mr-1"/>
	  	<input type="button" value="선택항목삭제" onclick="selectFileDelete()" class="btn btn-danger btn-sm" />
	</div>
	<hr/>
	<form name="myform">
	<c:forEach var="file" items="${files}" varStatus="st">
		<input type="checkbox" name="fileFlag" id="fileFlag${st.index}" value="${file}"/>
		${st.count}. <a href="${ctp}/images/pdsTest/${file}" download="${file}">${file}</a>
		<input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger btn-sm" />
		<input type="button" value="자바다운로드" onclick="location.href='JavaFileDownload.st?file=${file}';" class="btn btn-sm btn-secondary" />
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
	</form>
	<hr/>
	<p><input type="button" value="돌아가기" onclick="location.href='FileUpload.st';" class="btn btn-warning"/></p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>