<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="menu">
                <ul class="tree-view">
                    <div style="color: #ccc; pointer-events: none;">카테고리</div>
                    <li><a href="http://192.168.50.66:9090/javaclass/index3.jsp">Home</a></li>
                    <hr/>
                    <li><a href="">Guest</a></li>
                    <hr/>
                    <li><a href="">Board</a></li>
                    <hr/>
                    <li><a href="">PDS</a></li>
                    <hr/>
                    <details close>
                        <summary>Study1</summary>
                        <ul>
                            <li class="sub"><a href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경</a></li>
                            <li class="sub"><a href="">성적계산</a></li>
                            <li class="sub"><a href="">쿠키연습</a></li>
                            <li class="sub"><a href="">세션연습</a></li>
                            <li class="sub"><a href="">어플리케이션연습</a></li>
                            <li class="sub"><a href="">Storage 연습</a></li>
                            <li class="sub"><a href="">아이디 쿠키연습</a></li>
                            <li class="sub"><a href="">EL연습</a></li>
                        </ul>
                    </details>
                </ul>
            </div>