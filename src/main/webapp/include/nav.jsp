<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <%-- <a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a> --%>
  <a class="navbar-brand" href="http://192.168.50.66:9090/javaclass/Main">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList">Guest</a>
      </li>
      <%if(!mid_.equals("")) { %>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>    
      <li class="nav-item mr-2">
        <!-- <a class="nav-link" href="#">Study</a> -->
        <div class="dropdown">
		    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
		      Study1
		    </button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/e1_Login.jsp">쿠키아이디저장연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp?jumsu=88&code=S">JSTL연습</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_Filter.jsp">필터한글연습</a>
		      <%-- <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_Certification.jsp">인증코드발행(관리자)</a> --%>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t03_init.jsp">공통변수확인</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿생명주기</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스연습</a>
		    </div>
		 </div>
      </li>
      <li class="nav-item">
        <!-- <a class="nav-link" href="#">Study</a> -->
        <div class="dropdown">
		    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
		      Study2
		    </button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/study/password/passCheck.jsp">비밀번호 암호화</a>
		    </div>
		 </div>
      </li>
      <%} %>
      <li class="nav-item">
        <%if(!mid_.equals("")) { %>
        <a class="nav-link" href="${pageContext.request.contextPath}/database/Logout">Logout</a>
        <%} else { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/study/database/login.jsp">Login</a>
        <%} %>
      </li>    
    </ul>
  </div>  
</nav>