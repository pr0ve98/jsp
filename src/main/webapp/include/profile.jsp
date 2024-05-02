<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = session.getAttribute("sName")==null ? "손님" : (String)session.getAttribute("sName");
	pageContext.setAttribute("name", name);
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
                    <img src="<%=request.getContextPath() %>/images/profile.png" />
                    <br/>
                    <p id="pp">
                        <img src="<%=request.getContextPath() %>/images/star.png" style="width: 10%;" />
                        <b>&nbsp;${name}</b>
                    </p>
                    안녕하세요
                    <br/><br/>
                </div>
            </div>
        </div>