<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    String saveMid = "";
    String check = "";
    for(int i=0; i<cookies.length; i++) {
        if(cookies[i].getName().equals("cMid")) {
        	saveMid = cookies[i].getValue();
        	check = "checked";
        }
    }
    pageContext.setAttribute("saveMid", saveMid);
    pageContext.setAttribute("check", check);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/include/window98.jsp" %>
    <title>Hanna's Homepage</title>
    <%@ include file = "/include/98css.jsp" %>
      <style>
		.window-body {
			position: relative;
		}
		form {
			position: absolute;
			top: 160%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		#mid #pwd {
			width: 500px;
		}
		.main {
			height: 350px;
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
                <div class="title-bar-text">Login</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body">
                <div class="field-row-stacked">
						<div>
                			<h2>로그인</h2>
							<form name="myform" method="post" action="${pageContext.request.contextPath}/j0427/LoginOk">
								<div class="field-row-stacked" style="width: 200px">
								  <label for="mid">ID</label>
								  <input type="text" name="mid" id="mid" value="${saveMid}" placeholder="아이디를 입력하세요" required autofocus />
								</div>
								<div class="field-row-stacked" style="width: 200px">
								  <label for="pwd">Password</label>
								  <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
								</div>
								<p>
									<input type="checkbox" name="idSave" id="idSave" value="저장" ${check} />
									<label for="idSave">아이디 저장&nbsp;&nbsp;&nbsp;</label>
									<input type="submit" value="로그인" />
								</p>
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