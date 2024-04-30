<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
<div class="menu">
  <ul class="tree-view">
      <div style="color: #ccc; pointer-events: none;">카테고리</div>
      <li><a href="http://192.168.50.66:9090/javaclass/">Home</a></li>
      <hr/>
      <li><a href="">Guest</a></li>
      <%if(!mid_.equals("")) { %>
      <hr/>
      <li><a href="">Board</a></li>
      <hr/>
      <li><a href="">PDS</a></li>
      <hr/>
      <details close>
          <summary>Study1</summary>
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
            </ul>
        </details>
       <%} %>
    </ul>
</div>