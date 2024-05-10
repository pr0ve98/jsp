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
		
		function pageSizeCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href = "${ctp}/GuestList?pag=${pag}&pageSize="+pageSize;
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
       			<div class="window-body main-content" id="guest-body">
	                <div class="field-row-stacked">
	                	<div class="text-left">
							 <form name="myform" method="post" action="${ctp}/GuestInputOk">
							  <div class="form-group">
							    <label for="name">닉네임</label>
							    <c:if test="${sNickName==null}"><c:set var="sNickName" value="익명"></c:set></c:if>
							    <input type="text" class="form-control" id="name" value="${sNickName}" name="name" required />
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
			<div class="window guest">
       			<div class="window-body" id="page-body">
	                <div class="field-row-stacked" id="main-font">
	                	<div class="text-center">
	                	<c:if test="${pag > 1}">
	                		<a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}" title="첫페이지">◁</a>
	                		<a href="${ctp}/GuestList?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>
	                	</c:if>
	                	${pag}/${totPage}
	                	<c:if test="${pag < totPage}">
	                		<a href="${ctp}/GuestList?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>
	                		<a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">▷</a>
	                	</c:if>
	                	<select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
	                		<option <c:if test="${pageSize == 3}">selected</c:if>> 3</option>
	                		<option <c:if test="${pageSize == 5}">selected</c:if>> 5</option>
	                		<option <c:if test="${pageSize == 10}">selected</c:if>> 10</option>
	                		<option <c:if test="${pageSize == 20}">selected</c:if>> 20</option>
	                	</select>
						</div>
					</div>
				</div>
	        </div>
	        <c:set var="curScrStartNo" value="${curScrStartNo}"/>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="window guest">
		            <div class="title-bar">
		                <div class="title-bar-text">${curScrStartNo}번째 방명록</div>
		                <div class="title-bar-controls">
		                    <button aria-label="Minimize"></button>
		                    <button aria-label="Maximize"></button>
		                    <c:if test="${sLevel == 0 || sNickName == vo.name}"><button aria-label="Close" onclick="javascript:delCheck(${vo.idx})"></button></c:if>
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
										<th>닉네임</th>
										<td>
											<div style="display:flex; justify-content:center; align-item:center;">
												<img src="${ctp}/images/star2.png" style="width: 23px;" />
												<span>&nbsp;${vo.name}</span>
											</div>
										</td>
										<th>작성시간</th>
										<td>${fn:substring(vo.visitDate, 0, 19)}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">
											<%--
											<c:if test="${vo.email == '' || vo.email == null}">없음</c:if>
											<c:if test="${vo.email != '' && vo.email != null}">${vo.email}</c:if>
											--%>
											<c:if test="${empty vo.email || fn:length(vo.email)<6 || fn:indexOf(vo.email, '@') == -1 || fn:indexOf(vo.email, '.') == -1}">없음</c:if>
											<c:if test="${!empty vo.email && fn:length(vo.email)>=6 && fn:indexOf(vo.email, '@') != -1 && fn:indexOf(vo.email, '.') != -1}">${vo.email}</c:if>
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td colspan="3">
											<c:if test="${empty vo.homePage || fn:length(vo.homePage)<=10 || fn:indexOf(vo.homePage, '.')==-1}">없음</c:if>
											<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>10 && fn:indexOf(vo.homePage, '.')!=-1}"><a href='${vo.homePage}' target='_blank'>${vo.homePage}</a></c:if>
										</td>
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
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
			</c:forEach>
			
			<!-- 블록페이지 시작 -->
			<div class="window">
				<div class="window-body" id="main-font">
					<ul class="pagination">
						<c:if test="${pag > 1}"><li class="page-item"><a class="page-link" href="${ctp}/GuestList?pag=1&pageSize=${pageSize}">시작페이지</a></li></c:if>
						<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link" href="${ctp}/GuestList?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
						<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
							<c:if test="${i<=totPage && i == pag}"><li class="page-item active"><a class="page-link" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
							<c:if test="${i<=totPage && i != pag}"><li class="page-item"><a class="page-link" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link" href="${ctp}/GuestList?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
						<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link" href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
					</ul>
				</div>
			</div>
			<!-- 블록페이지 끝 -->
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