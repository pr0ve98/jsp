<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/include/window98.jsp" %>
    <!-- <link rel="stylesheet" href="https://unpkg.com/98.css"> -->
    <title>Hanna's Homepage</title>
    <%@ include file = "/include/98css.jsp" %>
    <script>
    	'use strict';
    	
    	function fCheck(idx) {
			let pwd = myform.pwd.value;
			if(pwd.trim()=="") {
				alert("비밀번호를 입력하세요.");
				myform.pwd.focus();
			}
			else {
				myform.idx.value = idx;
				myform.action = "${ctp}/study/password/PassCheck";
				myform.submit();
			}
		}
    </script>
</head>
<body>
    <div class="container">
        <section>
            <div class="item header"></div>
        </section>
		<%@ include file = "/include/login.jsp" %>
        <section class="item sbody">
            <%@ include file = "/include/profile.jsp" %>
            <%@ include file = "/include/menu.jsp" %>
        </section>
        <div class="window main">
            <div class="title-bar">
                <div class="title-bar-text">비밀번호 암호화</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
						<div>
                			<h2>비밀번호 암호화</h2>
                			<pre>
암호학에서는 솔트(salt)는 데이터, 비밀번호, 통과암호를 해시처리하는 단방향 함수의 추가 입력으로 사용되는 랜덤 데이터이다.
솔트는 스토리지에서 비밀번호를 보호하기 위해 사용된다.
솔트는 레인보우 테이블(rainbow table: 해시테이블)과 같은 미리 계산된 테이블을 사용하는 공격을 방어한다.
</pre>
                			<br/>
                			<p id="tt">비밀번호를 10자 이내로 입력하세요.</p>
							<form name="myform" method="post" class="form-center">
								<div class="field-row-stacked" style="width: 200px">
								  <label for="mid">ID</label>
								  <input type="text" name="mid" id="mid" value="${sMid}" placeholder="아이디를 입력하세요" required autofocus />
								</div>
								<div class="field-row-stacked" style="width: 200px">
								  <label for="pwd">Password</label>
								  <input type="password" name="pwd" id="pwd" value="1234" maxlength="10" placeholder="비밀번호를 입력하세요" required />
								</div>
								<br/>
								<p>
									<input type="button" value="숫자비밀번호" onclick="fCheck(1)" />
									<input type="button" value="문자비밀번호" onclick="fCheck(2)" />
								</p>
								<input type="hidden" name="idx" />
							</form>
							<br/>
							<div id="main-font">비밀번호를 전송후 콘솔창에서 암호화된 비밀번호를 확인하세요.</div>
						</div>
                </div>
            </div>
        </div>
        <section>
            <div class="item footer"></div>
        </section>
    	</div>
</body>
</html>