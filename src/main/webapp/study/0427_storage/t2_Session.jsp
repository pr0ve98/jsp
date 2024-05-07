<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<%
	String sId = session.getId();
	pageContext.setAttribute("sId", sId);
%>
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
        <div class="login">
			<%@ include file = "/include/login.jsp" %>
		</div>
        <section class="item sbody">
            <%@ include file = "/include/profile.jsp" %>
            <%@ include file = "/include/menu.jsp" %>
        </section>
        <div class="window main">
            <div class="title-bar">
                <div class="title-bar-text">세션 연습</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body main-content">
                <div class="field-row-stacked">
                	<div class="text-center">
						<h2>세션연습 메인메뉴</h2>
						<hr/>
						<form name="myform" method="post" action="t2_SessionSave.jsp">
							<table class="text-center">
								<tr>
									<td colspan="2">로 그 인(세션아이디:${sId})</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" name="mid" value="${sMid}"  class="form-control" required autofocus /></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td><input type="text" name="nickName" value="${sNickName}" class="form-control" required /></td>
								</tr>
								<tr>
									<th>성명</th>
									<td><input type="text" name="name" value="${sName}" class="form-control" required /></td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="mr-3">세션저장</button>
										<button onclick="location.href='t2_SessionCheck.jsp'" class="mr-3">세션확인</button>
										<button onclick="location.href='t2_SessionAllDelete.jsp'" class="mr-3">전체세션삭제</button>
										<button onclick="location.href='t2_SessionDelete.jsp'">개별세션삭제</button>
									</td>
								</tr>
							</table>
						</form>
						<hr/>
					</div>
                </div>
            </div>
        </div>
        <section>
            <div class="item footer"></div>
        </section>
        		<div class="mobileLogin">
			<%@ include file = "/include/mobileLogin.jsp" %>
        </div>
    </div>
</body>
</html>