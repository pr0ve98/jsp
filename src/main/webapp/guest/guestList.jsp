<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %> <!-- 줄띄움 편법 -->
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file = "/include/window98.jsp" %>
	<title>guestList.jsp</title>
    <%@ include file = "/include/98css.jsp" %>
	<style>
		.guest {
			margin-bottom: 2%;
		}
		#content {height: 100px;}
	</style>
	<script>
		'use strict';
		
		function delCheck(idx) {
			let ans = confirm("현재 방명록 글을 삭제하시겠습니까?");
			if(ans) {
				location.href = '${ctp}/GuestDelete?idx='+idx;
				return false;
			}
		}
		function guestBodyMinimize() {
			let minBtn = document.getElementById("guest-body");
			minBtn.classList.add("guest-body-minimize");
		}
		function guestBodyMaximize() {
			let minBtn = document.getElementById("guest-body");
			minBtn.classList.remove("guest-body-minimize");
		}
	</script>
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
<%-- 			<div id="guestBtn">
				<button>관리자</button>
				<button onclick="location.href='${ctp}/guest/guestInput.jsp'">글쓰기</button>
			</div> --%>
        <div class="main">
			<div class="window guest">
	        	<div class="title-bar">
		            <div class="title-bar-text">방명록 작성</div>
			            <div class="title-bar-controls">
			            	<button aria-label="Minimize" onclick="guestBodyMinimize()"></button>
			            	<button aria-label="Maximize" onclick="guestBodyMaximize()"></button>
		            	</div>
	        	</div>
       			<div class="window-body main-content guest-body-minimize" id="guest-body">
	                <div class="field-row-stacked">
	                	<div class="text-left">
							 <form name="myform" method="post" action="${ctp}/GuestInputOk">
							  <div class="form-group">
							    <label for="name">성명</label>
							    <c:if test="${sName==null}"><c:set var="sName" value="익명"></c:set></c:if>
							    <input type="text" class="form-control" id="name" value="${sName}" placeholder="성명을 입력하세요." name="name" required />
							  </div>
							  <div class="form-group">
							    <label for="email">E-mail</label>
							    <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요." name="email" />
							  </div>
							  <div class="form-group">
							    <label for="homePage">Homepage</label>
							    <input type="text" class="form-control" id="homePage" placeholder="홈페이지를 입력하세요." name="homePage" />
							  </div>
							  <div class="form-group">
							    <label for="content">방문소감</label>
							    <textarea rows="5" name="content" id="content" required class="form-control"></textarea>
							  </div>
							  <div class="form-group text-center">
							  	<button type="submit" class="btn btn-primary mr-3">방명록 등록</button>
							  	<button type="reset" class="btn btn-warning mr-3">방명록 다시입력</button>
							  </div>
							  <%-- <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>" /> --%>
							  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
							</form>
						</div>
					</div>
				</div>
	        </div>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="window guest">
		            <div class="title-bar">
		                <div class="title-bar-text">${vo.idx}번째 방명록</div>
		                <div class="title-bar-controls">
		                    <button aria-label="Minimize"></button>
		                    <button aria-label="Maximize"></button>
		                    <c:if test="${sMid == 'admin'}"><button aria-label="Close" onclick="javascript:delCheck(${vo.idx})"></button></c:if>
		                </div>
		            </div>
		            <div class="window-body main-content">
		                <div class="field-row-stacked">
		                	<div class="text-center">
								<span style="float: right; margin: 10px 0 2px;">아이피: ${vo.hostIp}</span>
								<table class="table table-borderless m-0 p-0">
								</table>
								<table class="table table-bordered text-center">
									<tr>
										<th>성명</th>
										<td>${vo.name}</td>
										<th>작성시간</th>
										<td>${vo.visitDate}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">${vo.email}</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td colspan="3">${vo.homePage}</td>
									</tr>
									<tr id="content">
										<th>내용</th>
										<td colspan="3">${fn:replace(vo.content, newLine, "<br/>")}</td>
									</tr>
								</table>
								<br/>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
        <section>
            <div class="item footer"></div>
        </section>
        		<div class="mobileLogin">
			<%@ include file = "/include/mobileLogin.jsp" %>
        </div>
    </div>
</body>
</html>