<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl2.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>JSTL(Java Standard Tag Library)</h2>
	<div class="text-right">
		<button type="button" onclick="location.href='jstl1.jsp';" class="btn btn-success btn-sm">JSTL core라이브러리</button>
		<button type="button" onclick="location.href='jstl3_vo.jsp';" class="btn btn-primary btn-sm">JSTL 반복문응용</button>
		<button type="button" onclick="location.href='jstl4_function.jsp';" class="btn btn-info btn-sm">JSTL 함수</button>
		<button type="button" onclick="location.href='jstl5_format.jsp';" class="btn btn-secondary btn-sm">JSTL Formatting</button>
	</div>
	<hr/>
	<h3>JSTL 반복문(core라이브러리 사용: forEach문)</h3>
	<pre>
		사용법1: < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수">~~~< / c : forEach>
			: step이 1인 경우는 생략 가능하다
		사용법2: < c : forEach var="변수" items=" $ {객체명/배열}" varStatus="매개변수">~~~< / c : forEach>
		사용법3: < c : forTokens var="변수" items=" $ {객체명/배열}" delims="구분기호">~~~< / c : forTokens> 
	</pre>
	<hr>
	
	<p>사용법 1</p>
	<%-- <%for(int i=0; i<10; i++){ } %> --%>
	<%-- <c:forEach var="i" begin="1" end="10" step="1" varStatus="st"> --%>
	<c:forEach var="i" begin="1" end="10">
		${i} /
	</c:forEach>
	<br/><br/>
	
	<p>사용법 2</p>
	<%
	String[] cards = {"국민","BC","신한","현대","삼성","농협","비자"};
	pageContext.setAttribute("cards", cards);
	%>
	<c:forEach var="card" items="${cards}">
		${card} /
	</c:forEach>
	<br/><br/>
	
	<p>사용법 3</p>
	<c:set var="hobbys" value="영화/게임/노래/독서/댄스/수영/음악듣기" />
	취미: ${hobbys }<br/>
	<c:forTokens var="hobby" items="${hobbys }" delims="/">
		${hobby }, 
	</c:forTokens>
	<br/><br/>
	
	<p>사용법 4(상태변수 사용예제)</p>
	<pre>
		상태변수 예약어: count - 1부터 1씩 증가처리,
				index - 인덱스번호(0번부터 시작)
				current - 현재 아이템
				first - 첫번째 아이템인가?
				last - 마지막번째 아이템인가?
	</pre>
	<c:forEach var="card" items="${cards}" varStatus="st">
		${st.count}.(${st.index}) : ${card} : 조건? a.${st.current} / b.${st.first} / c.${st.last}<br/>
	</c:forEach>
	<br/><br/>
	<hr/>
	
	<h4>사용예제</h4>
	<h5>구구단 5단을 출력하세요</h5>
		★구구단 5단★<br/>
	<c:forEach var="i" begin="1" end="9">
		5 * ${i} = ${5*i}<br/>
	</c:forEach>
	<br/>
	
	<h5>구구단 3단~5단까지 출력하시오(2중 for문)</h5>
	<c:forEach var="i" begin="3" end="5">
		★구구단 ${i }단★<br/>
		<c:forEach var="j" begin="1" end="9">
			${i } * ${j } = ${i*j}<br/>
		</c:forEach><br/>
	</c:forEach>
	<br/>
	
	<h5>3.저장된 그림 5장을 출력하시오.</h5>
	<div>
		<c:forEach var="i" begin="111" end="115" varStatus="st">
			<img src="${ctp}/images/${i}.jpg" width="100px" />
		</c:forEach>
	</div>
	<br/>
	
	<h5>4.배열에 그림명을 저장후 배열에 저장된 그림을 출력하시오. (단, 1줄에는 3개의 그림씩 출력하시오.)</h5>
	<div>
		<c:set var="imgs" value="111.jpg/112.jpg/113.jpg/114.jpg/115.jpg" />
		<c:forTokens var="img" items="${imgs}" delims="/" varStatus="st">
			<img src="${ctp}/images/${img}" width="100px" />
			<c:if test="${st.count % 3 == 0}"><br/></c:if>
		</c:forTokens>
	</div>
	<br/>
	
	<h5>5.2차원 형식의 배열에 저장된 자료를 한행에 3개의 항목씩 출력하시오.</h5>
	<%
	String[][] members = {
		{"홍길동","23","서울"},
		{"김말숙","26","청주"},
		{"이기자","33","제주"},
		{"강감찬","45","인천"},
		{"김연아","19","서울"}
	};
	pageContext.setAttribute("members", members);
	%>
	<c:forEach var="member" items="${members}">
		<c:forEach var="m" items="${member}">
			${m} / 
		</c:forEach><br/>
	</c:forEach>
	<br/>
	
	<h5>6.5번 문제 배열에서 '서울'단어에는 빨간색으로 표시해 출력하시오.</h5>
	<c:forEach var="member" items="${members}">
		<c:forEach var="m" items="${member}">
			<c:if test="${m == '서울'}"><span style="color:red">
			${m} 
			</span></c:if>
			<c:if test="${m != '서울'}">
			${m} / 
			</c:if>
		</c:forEach><br/>
	</c:forEach>
	<br/>
	
	<h5>7.나이가 25세 미만은 굵고 파랑색 표시</h5>
	<c:forEach var="member" items="${members}">
		<c:forEach var="m" items="${member}">
			<c:if test="${m < '25'}"><span style="color:blue"><b>${m}</b></span> / </c:if>
			<c:if test="${m >= '25'}">${m} / </c:if>
		</c:forEach><br/>
	</c:forEach>
	<br/>
	
	<h5>8.앞의 사용법2번에 저장한 cards의 내용 중 첫번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 스카이블루</h5>
	<c:forEach var="card" items="${cards}" varStatus="st">
		<c:if test="${st.first}"><span style="background-color:yellow;">${card}</span></c:if>
		<c:if test="${st.last}"><span style="background-color:skyblue;">${card}</span></c:if>
		<c:if test="${!st.first && !st.last}"> ${card} </c:if>
	</c:forEach>
	<br/><br/>
	
	<h5>9.앞의 사용법2번에 저장한 cards의 내용 중 '국민카드'는 파란색, '삼성카드'는 빨간색, 첫번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 스카이블루</h5>
	<c:forEach var="card" items="${cards}" varStatus="st">
		<c:if test="${st.first}">
			<c:if test="${card == '국민'}"><span style="background-color:yellow;color:blue;">${card}</span></c:if>
			<c:if test="${card == '삼성'}"><span style="background-color:yellow;color:red;">${card}</span></c:if>
			<c:if test="${card != '국민' && card != '삼성'}"><span style="background-color:yellow;">${card}</span></c:if>
		</c:if>
		<c:if test="${st.last}">
			<c:if test="${card == '국민'}"><span style="background-color:skyblue;color:blue;">${card}</span></c:if>
			<c:if test="${card == '삼성'}"><span style="background-color:skyblue;color:red;">${card}</span></c:if>
			<c:if test="${card != '국민' && card != '삼성'}"><span style="background-color:skyblue;">${card}</span></c:if>
		</c:if>
		<c:if test="${!st.first && !st.last && card == '국민'}"><span style="color:blue;">${card}</span></c:if>
		<c:if test="${!st.first && !st.last && card == '삼성'}"><span style="color:red;">${card}</span></c:if>
		<c:if test="${!st.first && !st.last && card != '국민' && card != '삼성'}"> ${card} </c:if>
	</c:forEach>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>