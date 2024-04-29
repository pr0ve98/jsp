<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>t02Res.jsp</title>
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
                <div class="title-bar-text">성적 결과</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div style="display: flex; flex-direction: column; align-items: center;">
						<h2>성적처리 결과</h2>
						<hr/>
						<p>성명: ${vo.name} / ${param.name}</p>
						<p>학번: ${vo.hakbun} / ${param.hakbun}</p>
						<p>국어: ${vo.kor} / ${param.kor}</p>
						<p>영어: ${vo.eng} / ${param.eng}</p>
						<p>수학: ${vo.mat} / ${param.mat}</p>
						<p>사회: ${vo.soc} / ${param.soc}</p>
						<p>과학: ${vo.sci} / ${param.sci}</p>
						<p>총점: ${vo.tot} / ${param.tot}</p>
						<p>평균: ${vo.avg} / ${param.avg}</p>
						<p>학점: ${vo.grade} / ${param.grade}</p>
						<hr/>
						<p><a href="<%=request.getContextPath() %>/study/0426/t02.jsp" class="btn btn-warning">돌아가기</a></p>
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