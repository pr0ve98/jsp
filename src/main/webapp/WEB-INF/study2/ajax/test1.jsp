<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test1.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function idCheck(mid) {
			if(mid == ""){
				alert("아이디를 입력하세요.");
				myform.mid.focus();
				return "0";
			}
		}
		
		// 동기식
		function idCheck0() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag != "0") location.href = "${ctp}/ajaxIdCheck0.st?mid="+mid;
		}
		
		// 비동기식(브라우저에서 제공하는 객체(XMLHttpRequest))
		function idCheck1() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "${ctp}/ajaxIdCheck1.st?mid="+mid);
			xhr.send();
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					demo.innerHTML = xhr.responseText;
				}
			}
		}
		
		// 비동기식(fetch() 사용)
		function idCheck2() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;
			
			fetch("${ctp}/ajaxIdCheck1.st?mid="+mid)
				/* .then((res) => res.json()) */
				.then((res) => console.log("res: ", res))
				.catch((error) => console.log("error: ", error));
		}
		
		// 비동기식(브라우저에서 제공하는 객체(XMLHttpRequest))
		function idCheck3() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "${ctp}/ajaxIdCheck1.st?mid="+mid);
			xhr.send();
			
			xhr.addEventListener("load", (e) => {
				console.log("e값: ", e);
				
				if(e.target.status == 200) {
					demo.innerHTML = '검색한 아이디는? '+mid+", 성명은? "+e.target.responseText;
				}
				else {
					demo.innerHTML = '검색 서버 오류!!';
				}
			});
		}
		
		// 비동기식(ajax 사용)
		function idCheck4() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck1", // 디렉토리 패턴
				type : "get", // 기본 방식이 get방식
				data : {"mid" : mid},
				//dataType : "json",
				contextType : "application/json",
				charset : 'utf-8',
				timeout : 10000,
				beforeSend : function() {
					console.log("mid(전송 전): ", mid);
				},
				success : function(res) {
					let str = "<font color='blue'>검색아이디: "+mid+", 성명: "+res+"</font>";
					$("#demo").html(str);
				},
				error : function() {
					alert("오류났어요!!!");
				},
				complete : function() {
					console.log("mid(전송 후): ", mid);
				}
			});
		}
		
		// 비동기식(ajax 사용2) 위에 다 필요없고 이것만 알면 됨!!!
		function idCheck5() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck1", // 디렉토리 패턴
				// type : "get", // 기본 방식이 get방식
				data : {"mid" : mid},
				success : function(res) {
					let str;
					if(res == "") str = "<font color='red'>검색한 아이디가 없습니다</font>";
					str = "<font color='blue'>검색아이디: "+mid+", 성명: "+res+"</font>";
					$("#demo").html(str);
				},
				error : function() {
					alert("오류났어요!!!");
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
	<div>
		<form name="myform">
			아이디:
			<input type="text" name="mid" id="mid" class="form-control mb-2" />
			<div>
				<input type="button" value="아이디검색(동기식)" onclick="idCheck0()" class="btn btn-success mr-3"/>
				<input type="button" value="아이디검색(비동기식1)" onclick="idCheck1()" class="btn btn-primary mr-3"/>
				<input type="button" value="아이디검색(비동기식2)" onclick="idCheck2()" class="btn btn-secondary mr-3"/>
				<input type="button" value="아이디검색(비동기식3)" onclick="idCheck3()" class="btn btn-info mr-3"/>
				<input type="button" value="아이디검색(AJAX1)" onclick="idCheck4()" class="btn btn-warning mr-3"/>
				<input type="button" value="아이디검색(AJAX2)" onclick="idCheck5()" class="btn btn-danger mr-3"/>
			</div>
		</form>
		<hr/>
			<div id="demo"><font color='blue'>출력결과: <b>${param.name}</b></font></div>		
		<hr/>
	</div>
	<h2>HTTP통신</h2>
	<pre>
	동기식(Synchronous): 먼저 시작된 하나의 작업이 끝날때까지 다른 작업들은 시작하지 않고 기다렸다가, 앞의 작업이 모두 끝나면
		새로운 작업을 시작하는 방식이다.
	비동기식(Asynchronous): 먼저 시작된 작업의 완료여부와 상관없이 새로운 작업을 시작하는 방식이다.
	- 바닐라 자바스크립트의 비동기식: 브라우저의 XMLHttpRequest
	- ECMA6 자바스크립트의 비동기식: 콜백함수, Promise, Promise를 활용한 async/await, fetch()방식
	
	<h4>AJAX</h4>
	AJAX(Asynchronous Javascript And Xml): 자바스크립트 라이브러리 중의 하나이며, 브라우저가 객체인 XMLHttpRequest를
		이용해서 전체페이지를 고치지 않아도 부분적인 페이지 일부만을 위한 데이터를 로드하는 기법
		즉, 자바스크립트를 이용하여 서버에 데이터를 요청할때 비동기식으로 통신하는 방식. 과거는 XML 방식을 많이 선호하였으니, 지금은 JSON방식을 많이 사용한다.
	
	<h5>AJAX에서의 메소드(전송방식) 종류</h5>
	- GET: 데이터를 읽거나 주로 검색할 때 사용
	- POST: 새로운 리소스를 생성할 때 사용
	- PUT: 리소스를 생성/업데이트할 때 사용
	- DELETE: 지정된 리소스를 삭제할 때 사용
	</pre>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>