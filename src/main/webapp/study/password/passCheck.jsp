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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="https://unpkg.com/98.css"> -->
    <title>Hanna's Homepage</title>
    <%@ include file = "/include/98css.jsp" %>
    <script>
    	'use strict';
    	
    	if('${msg}' == 'OK') alert("전송완료! 콘솔창을 확인하세요.");
    	
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
    	
    	// AJAX를 활용한 암호화된 문자 화면에 출력시켜주기
        let strPwd = "";
        let pwdIdx = 0;
        function pwdCheck(flag) {
        	let mid = myform.mid.value;
        	let pwd = myform.pwd.value;
        	if(pwd.trim() == "") {
        		alert("비밀번호를 입력하세요");
        		myform.pwd.focus();
        		return false;
        	}
        	
        	$.ajax({
        		url  : "${ctp}/PassCheckAjax",
        		type : "get",
        		data : {
        			mid : mid,
        			pwd : pwd,
        			flag : flag
        		},
        		success:function(res) {
        			pwdIdx++;
        			strPwd += pwdIdx + " : " + res + "<br/>";
        			demo.innerHTML = strPwd;
        		},
        		error : function() {
        			alert("전송 오류!!");
        		}
        	});
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
								  <input type="password" name="pwd" id="pwd" value="1234" maxlength="9" placeholder="비밀번호를 입력하세요" required />
								</div>
								<br/>
								<input type="hidden" name="idx" />
							</form>
							<p>
								<input type="button" value="숫자비밀번호" onclick="fCheck(1)" />
								<input type="button" value="문자비밀번호" onclick="fCheck(2)" />
								<input type="button" value="조합비밀번호" onclick="fCheck(3)" />
							</p>
							<p>
								<input type="button" value="숫자비밀번호(AJAX)" onclick="pwdCheck(1)" />
								<input type="button" value="문자비밀번호(AJAX)" onclick="pwdCheck(2)" />
								<input type="button" value="조합비밀번호(AJAX)" onclick="pwdCheck(3)" />
								<input type="button" value="SHA-256" onclick="pwdCheck(4)" />
							</p>
							<br/>
							<div id="main-font">비밀번호를 전송후 콘솔창에서 암호화된 비밀번호를 확인하세요.</div>
						</div>
					 	<hr/>
					 	<div id="main-font">
					  	<h5>암호화된 비밀번호</h5>
					  	<div id="demo"></div>
					  	</div>
					  	<hr/>
						<pre>
							<h4>SHA(Secure Hash Algorithm)</h4>
: SHA는 단방향식 암호화 기법으로, 암호학적 해시함수들의 모임이다.
일반적으로 복호화 할 수 없도록 만든 알고리즘으로, SHA-2라고도 한다.
해시함수가 출력되는 암축된 문장을 다이제스트(Digest)라고 하는데,
이때 SHA-2가 생성해주는 다이제스트의 출력길이는 256, 512Bit가 있다.
여기서 256Bit의 출력길이를 갖는 SHA-2 암호화 기법을 'SHA-256 암호화방식'이라고 한다.
						</pre>
                </div>
            </div>
        </div>
        <section>
            <div class="item footer"></div>
        </section>
    	</div>
</body>
</html>