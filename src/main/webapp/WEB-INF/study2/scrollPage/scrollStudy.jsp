<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>scrollStudy.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
		.sample .box {
			margin: 20px auto;
			width: 400px;
			height: 200px;
			background-color: #eee;
			border: 2px solid #a6a6a6;
			padding: 20px;
			overflow: auto; 
		}
		.sample .small-box {
			width: 500px;
			height: 300px;
			background-color: #afeeee;
			border: 1px dashed #a6a6a6;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>
	<script>
		'use strict';
		
		$(function() {
			const box = document.querySelector(".sample .box");
			
			// box에서 스크롤시킬 때 정보 수집
			box.addEventListener("scroll",() => {
				let x = box.scrollLeft; // 스크롤바의 x축 시작좌표
				let y = box.scrollTop; // 스크롤바의 y축 시작좌표
				
				document.querySelector("#disp .h").innerHTML = x;
				document.querySelector("#disp .v").innerHTML = y;
			});
			
			document.querySelector(".sampleBtn .btn1").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft = 0;
				document.querySelector(".sample .box").scrollTop = 0;
			});
			document.querySelector(".sampleBtn .btn2").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft = 150;
			});
			document.querySelector(".sampleBtn .btn3").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop = 150;
			});
			document.querySelector(".sampleBtn .btn4").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft += 10;
			});
			document.querySelector(".sampleBtn .btn5").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft -= 10;
			});
			document.querySelector(".sampleBtn .btn6").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop += 10;
			});
			document.querySelector(".sampleBtn .btn7").addEventListener("click", (e)=>{
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop -= 10;
			});
		});
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h3>스크롤 학습하기</h3>
	<div class="sample text-center">
		<div class="box">
			<div class="small-box">
				<span class="text-success"><b>박스 안에서 스크롤바를 상하좌우로 이동해 보세요</b></span>
			</div>
		</div>
	</div>
	<div class="text-danger text-center" id="disp">
		<strong>
			<span class="h">0</span> px /
			<span class="v">0</span> px
		</strong>
	</div>
	<hr/>
	<div class="sampleBtn">
		<div><input type="button" value="초기화" class="btn btn-success mb-2 btn1" /></div>
		<div>
			<input type="button" value="x축 +150px" class="btn btn-primary mb-2 btn2" />
			<input type="button" value="y축 +150px" class="btn btn-outline-primary mb-2 btn3" />
		</div>
		<div>
			<input type="button" value="x축 +10px" class="btn btn-secondary mb-2 btn4" />
			<input type="button" value="x축 -10px" class="btn btn-outline-secondary mb-2 btn5" />
		</div>
		<div>
			<input type="button" value="y축 +10px" class="btn btn-warning mb-2 btn6" />
			<input type="button" value="y축 -10px" class="btn btn-outline-warning mb-2 btn7" />
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>