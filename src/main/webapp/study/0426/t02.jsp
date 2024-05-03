<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>t02.jsp</title>
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
                <div class="title-bar-text">성적 계산</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div class="text-center" style="font-size:20pt;">
						<h2>성적계산하기</h2>
						<hr/>
						<div><a href="t02_1.jsp">방법 1(Servlet)</a></div>
						<div><a href="t02_2.jsp">방법 2(JSP)</a></div>
						<div><a href="t02_3.jsp">방법 3(JSP)</a></div>
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