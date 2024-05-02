<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid3 = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
    	<div>
    	<%if(!mid3.equals("")) { %>
        <button class="mBtn" onclick="location.href='${pageContext.request.contextPath}/j0427/Logout'">로그아웃</button>
        <%} else { %>
	    <button class="mBtn" onclick="location.href='<%=request.getContextPath()%>/study/database/login.jsp'">로그인</button>
	    <%} %>
        </div>