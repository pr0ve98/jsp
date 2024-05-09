<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level1 = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level1);
%>
    	<div>
    	<c:if test="${level <= 4}"><button class="loginBtn" onclick="location.href='${pageContext.request.contextPath}/MemberLogout.mem'">로그아웃</button></c:if>
        <c:if test="${level > 4}"><button class="loginBtn" onclick="location.href='<%=request.getContextPath()%>/MemberLogin.mem'">로그인</button></c:if>
        </div>