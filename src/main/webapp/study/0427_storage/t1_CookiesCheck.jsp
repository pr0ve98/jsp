<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>t1_CookiesCheck.jsp</title>
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
                	<div class="text-center" id="main-font">
					<h2>저장된 쿠키 확인하기</h2>
					<hr/>
					<p>
					<%
						Cookie[] cookies = request.getCookies();
						out.println("<br/>저장된 쿠키는?<br/><br/>");
						for(int i=0; i<cookies.length; i++){
							out.println("쿠키명: "+cookies[i].getName()+" , ");
							out.println("쿠키값: "+cookies[i].getValue()+" , ");
							out.println("쿠키만료시간: "+cookies[i].getMaxAge()+"<br/><br/>");
						}
					%>
					</p>
					<hr/>
					<button onclick="location.href='t1_Cookies.jsp'">돌아가기</button>
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