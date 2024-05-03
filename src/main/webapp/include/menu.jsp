<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="menu">
  <ul class="tree-view">
      <div style="color: #ccc; pointer-events: none;">카테고리</div>
      <li><a href="http://192.168.50.66:9090/javaclass/Main">Home</a></li>
      <hr/>
      <li><a href="${ctp}/GuestList">Guest</a></li>
      <%if(!mid_.equals("")) { %>
      <hr/>
      <li><a href="">Board</a></li>
      <hr/>
      <li><a href="">PDS</a></li>
      <hr/>
      <details close>
          <summary class="mb-2">Study1</summary>
          <ul>
              <li class="sub"><a href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경</a></li>
              <li class="sub"><a href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage 연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0427_storage/e1_Login.jsp">아이디 쿠키연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp?jumsu=88&code=S">JSTL연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_Filter.jsp">필터한글연습</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_Certification.jsp">인증코드발행(관리자)</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0430_web_xml/init/t03_init.jsp">공통변수 확인</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿생명주기</a></li>
                <li class="sub"><a href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스연습</a></li>
            </ul>
        </details>
      <details close>
          <summary>Study2</summary>
          	<ul>
               <li class="sub"><a href="<%=request.getContextPath()%>/study/password/passCheck.jsp">비밀번호 암호화</a></li>
            </ul>
        </details>
       <%} %>
    </ul>
</div>