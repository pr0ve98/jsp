<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid1 = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
    	<div>
    	<%if(!mid1.equals("")) { %>
        <button class="loginBtn" onclick="location.href='${pageContext.request.contextPath}/j0427/Logout'">로그아웃</button>
        <%} else { %>
	    <button class="loginBtn" onclick="location.href='<%=request.getContextPath()%>/study/0428_Login/login.jsp'">로그인</button>
	    <%} %>
        </div>