<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ex2_GuGuDan</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
		.container{
			width: 30%;
		}
	</style>
	<script>
		'use strict';
		
		function fCheck() {
			let su1 = document.getElementById("su1").value
			let su2 = document.getElementById("su2").value
			
			if(su1 > su2){
				alert("시작단은 끝단보다 클 수 없습니다.");
				document.getElementById("su1").focus();
			}
			else {
				myform.action="ex2_GuGuDanRes.jsp?su1="+su1+"&su2="+su2;
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
	<h2 class="text-center">구구단 입력받아 출력하기</h2>
	<hr/>
	<form name="myform">
		<p><input type="number" name="su1" id="su1" placeholder="시작단을 입력하세요." class="form-control" /></p>
		<p><input type="number" name="su2" id="su2" placeholder="끝단을 입력하세요." class="form-control" /></p>
		<p><input type="button" value="출력" onclick="fCheck()" class="btn btn-success form-control" /></p>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>