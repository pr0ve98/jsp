<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("utf-8");

	String mid = request.getParameter("mid")==null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName")==null ? "익명" : request.getParameter("nickName");
	String name = request.getParameter("name")==null ? "익명" : request.getParameter("name");
	
	System.out.println(mid+nickName+name);
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
%>
<script>
	alert("세션이 생성/저장되었습니다.");
	location.href = "t2_Session.jsp";
</script>