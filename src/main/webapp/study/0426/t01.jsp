<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<%
	String hostIp = request.getRemoteAddr(); // 호스트 현재 아이피 알아오는 명령
	/* request.setAttribute("hostIp", hostIp); */
	pageContext.setAttribute("hostIp", hostIp);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>t01.jsp</title>
    <%@ include file = "/include/98css.jsp" %>
    <style>
    	.main {
			height: 450px;
		}
    </style>
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
                <div class="title-bar-text">서버 환경</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div class="text-center">
	                	<h2>서버의 환경변수값 확인하기</h2>
						<hr/><br/>
						<div>호스트IP1: ${hostIp}</div>
						<div>호스트IP2: <%=hostIp %></div>
						<div>전송방식: <%=request.getMethod() %></div>
						<div>접속프로토콜: <%=request.getProtocol() %></div>
						<div>접속(서버)포트: <%=request.getServerPort() %></div>
						<div>접속(서버)이름: <%=request.getServerName() %></div>
						<div>접속 Context이름: <%=request.getContextPath() %></div>
						<div>접속 url: <%=request.getRequestURL() %></div>
						<div>접속 uri: <%=request.getRequestURI() %></div>
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