<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "/include/window98.jsp" %>
    <title>Hanna's Homepage</title>
    <%@ include file = "/include/98css.jsp" %>
    <style>
    	.main {
            margin-left: 0;
            display: grid;
            grid-template-columns: 4.8fr 1.2fr;
            column-gap: 3%;
    	}
    	@media screen and (min-width:768px) and (max-width:1023px) {
    		.main {grid-template-columns: 3fr 1fr;}
    	}
    	@media screen and (max-width:767px) {
    		.main {
    			width: 100%;
    			display:flex;
    			grid-template-columns: 1fr 0fr;
    		}
    		.sbody{
    			padding: 30px 0;
    			margin: 0 auto;
    		}
    		.mainA {margin: 0 auto 50px; width:80%;}
    		.mainB {display:none;}
    	}
    </style>
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
        	<div class="main">
	        <div class="window mainA">
	            <div class="title-bar">
	                <div class="title-bar-text">Home</div>
	                <div class="title-bar-controls">
	                    <button aria-label="Minimize"></button>
	                    <button aria-label="Maximize"></button>
	                    <button aria-label="Close"></button>
	                </div>
	            </div>
	            <div class="window-body">
	                <div class="field-row-stacked">
	                	<img src="<%=request.getContextPath() %>/images/4.jpg" />
	                </div>
	            </div>
	        </div>
        <div class="mainB">
	        <div class="window">
	            <div class="title-bar">
	                <div class="title-bar-text">신규 회원</div>
	                <div class="title-bar-controls">
	                    <button aria-label="Close"></button>
	                </div>
	            </div>
	            <div class="window-body">
	                <div class="field-row-stacked">
	           			<c:forEach var="vo" items="${recentVos}">
	           			<p id="pp">
	                        <img src="<%=request.getContextPath() %>/images/star2.png" style="width: 10%;" />
	                        <b>&nbsp;${fn:replace(vo.name, fn:substring(vo.name, 1, 2), '*')} 님</b>
                    	</p>
			        	</c:forEach>
	                </div>
	            </div>
	        </div>
        </div>
        </div>
        <section>
            <div class="footer"></div>
        </section>
    </div>
</body>
</html>