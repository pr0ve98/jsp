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
                <div class="title-bar-text">성적 자료</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div id="main-font">
						<h2>성적 자료</h2>
						<form name="myform" method="post" action="<%=request.getContextPath()%>/j0426/T02Ok">
							<p>성명: <input type="text" name="name" value="홍길동" autofocus/></p>
							<p>학번: <input type="text" name="hakbun" value="MS1234" /></p>
							<p>국어: <input type="text" name="kor" value="100" /></p>
							<p>영어: <input type="text" name="eng" value="90" /></p>
							<p>수학: <input type="text" name="mat" value="80" /></p>
							<p>사회: <input type="text" name="soc" value="70" /></p>
							<p>과학: <input type="text" name="sci" value="60" /></p>
							<input type="submit" value="계산"/>
							<input type="reset" value="재입력"/>
						</form>
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