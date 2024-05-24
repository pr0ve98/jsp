<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="menu">
	<c:if test="${level <= 4}">
		<ul class="tree-view mb-3">
			<details close>
				<summary>MyPage</summary>
				<ul>
					<li class="sub"><a href="MemberMain.mem">회원메인방</a></li>
					<c:if test="${level <= 4 && (level > 1 || level == 0)}">
						<li class="sub"><a href="Schedule.sc">일정관리</a></li>
						<li class="sub"><a href="#">메시지관리</a></li>
						<li class="sub"><a href="MemberList.mem">회원리스트</a></li>
					</c:if>
					   	<li class="sub"><a href="MemberPwdCheck.mem">회원정보수정</a></li>
						<li class="sub"><a href="MemberDelete.mem">회원탈퇴</a></li>
					<c:if test="${level == 0}"><li class="sub"><a href="AdminMain.ad">관리자메뉴</a></li></c:if>
				</ul>
			</details>
		</ul>
	</c:if>
	<ul class="tree-view">
	  <div style="color: #ccc; pointer-events: none;">카테고리</div>
	  <li><a href="http://192.168.50.66:9090/javaclass/Main">Home</a></li>
	  <hr/>
	  <li><a href="${ctp}/GuestList">Guest</a></li>
	  <c:if test="${level <= 4}">
	  <hr/>
	  <li><a href="BoardList.bo">Board</a></li>
	  </c:if>
	  <c:if test="${level <= 4 && (level > 1 || level == 0)}">
		<hr/>
	    <li><a href="PdsList.pds">PDS</a></li>
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
	        <summary class="mb-2">Study2</summary>
	        	<ul>
	             <li class="sub"><a href="<%=request.getContextPath()%>/study/password/passCheck.jsp">비밀번호 암호화</a></li>
	             <li class="sub"><a href="${ctp}/mapping/test1">디렉토리 매핑연습</a></li>
	             <li class="sub"><a href="${ctp}/mapping/test2.do">확장자 매핑연습</a></li>
	             <li class="sub"><a href="${ctp}/mapping/test3.do3">확장자 매핑연습3</a></li>
	             <li class="sub"><a href="${ctp}/mapping/test4.do4">확장자 매핑연습4</a></li>
	             <li class="sub"><a href="${ctp}/mapping/test5.do5">확장자 매핑연습5</a></li>
	             <li class="sub"><a href="${ctp}/ajaxTest1.st">AJAX연습(일반)</a></li>
	             <li class="sub"><a href="${ctp}/ajaxTest2.st">AJAX연습(응용)</a></li>
	             <li class="sub"><a href="${ctp}/ajaxTest3.st">AJAX연습(회원관리)</a></li>
	             <li class="sub"><a href="${ctp}/uuidForm.st">UUID연습</a></li>
	             <li class="sub"><a href="${ctp}/study/database/login.jsp">로그인연습</a></li>
	             <li class="sub"><a href="Modal1.st">모달연습</a></li>
	             <li class="sub"><a href="Modal2.st">모달연습2</a></li>
	             <li class="sub"><a href="FileUpload.st">파일업로드</a></li>
	          </ul>
	      </details>
	    <details close>
	        <summary class="mb-2">Study3</summary>
	        	<ul>
	             <li class="sub"><a href="Calendar1.st">캘린더연습1</a></li>
	             <li class="sub"><a href="Calendar2.st">캘린더연습2</a></li>
	          </ul>
	      </details>
	    </c:if>
	</ul>
</div>