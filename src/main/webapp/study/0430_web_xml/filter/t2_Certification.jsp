<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t2_Certification.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function ceritifitionCheck() {
			let ceritifition = myform.ceritifition.value;
			if(ceritifition == "" || ceritifition.length != 4){
				alert("인증코드를 확인하세요.(4자리)");
				return false;
			}
			else {
				location.href="${ctp}/j0430/T02_Certification?admin=admin&u="+ceritifition;
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>이곳은 인증코드 발급창입니다.</h2>
	<form name="myform">
		<div><input type="text" name="ceritifition" value="1234" class="form-control mb-1"></div>
		<div><input type="button" value="인증코드 발급" onclick="ceritifitionCheck()" class="btn btn-success form-control"/></div>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>