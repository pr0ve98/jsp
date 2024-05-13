<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String nickName = session.getAttribute("sNickName")==null ? "손님" : (String)session.getAttribute("sNickName");
	pageContext.setAttribute("nickName", nickName);
%>
<div class="window profile">
            <div class="title-bar">
                <div class="title-bar-text">프로필</div>
                <div class="title-bar-controls">
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body">
                <div class="field-row-stacker">
                    <img src="<%=request.getContextPath() %>/images/profile.png" class="profile-img" />
                    <br/>
	                <p id="pp">
	                    <c:if test="${sLevel == 0}"><img src="<%=request.getContextPath() %>/images/star0.png" style="width: 12%;" /></c:if>
	                    <c:if test="${sLevel == 1}"><img src="<%=request.getContextPath() %>/images/star1.png" style="width: 10%;" /></c:if>
	                    <c:if test="${sLevel == 2}"><img src="<%=request.getContextPath() %>/images/star2.png" style="width: 10%;" /></c:if>
	                    <c:if test="${sLevel == 3}"><img src="<%=request.getContextPath() %>/images/star3.png" style="width: 10%;" /></c:if>
	                    <c:if test="${sLevel > 4 || sLevel == null}"><img src="<%=request.getContextPath() %>/images/star99.png" style="width: 10%;" /></c:if>
                        <b>&nbsp;${nickName}</b>
                    </p>
                    안녕하세요
                    <br/><br/>
                </div>
            </div>
        </div>