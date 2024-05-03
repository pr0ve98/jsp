<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>t1_Cookies.jsp</title>
    <%@ include file = "/include/98css.jsp" %>
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
                <div class="title-bar-text">쿠키 연습</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div class="text-center">
					<h2>쿠키연습 메인메뉴</h2>
					<hr/>
					<button onclick="location.href='t1_CookiesSave.jsp'">쿠키저장</button>
					<button onclick="location.href='t1_CookiesCheck.jsp'">쿠키확인</button>
					<button onclick="location.href='t1_CookiesAllDelete.jsp'">전체쿠키삭제</button>
					<button onclick="location.href='t1_CookiesPwdDelete.jsp'">비밀번호 쿠키삭제</button>
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