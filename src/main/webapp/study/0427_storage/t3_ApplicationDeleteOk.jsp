<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationDeleteOk.jsp -->
<%
	String applicationSW = request.getParameter("applicationSW");
	application.removeAttribute(applicationSW);
%>
<script>
	alert("<%=applicationSW%> 애플리케이션이 삭제되었습니다.");
	location.href = "t3_Application.jsp";
</script>