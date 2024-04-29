<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>el1.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>EL(expression Language)</h2>
	<p>저장소(서버 저장소:ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
	<hr/>
	<pre>
		용도: 사용자가 '변수/값/수식/객체'등을 전송 받은 후에 저장, 또는 기타 처리하는 용도로 사용함.
		표기법: $ {변수/값/객체}
		서버 저장소: Application / Session / PageContext / Request
	</pre>
	<hr/>
	<%
	String atom = "Seoul";
	String name = "홍길동";
	int su1 = 100, su2 = 200;
	String su3 = "100", su4 = "400";
	%>
	<h4>스크립틀릿을 이용한 출력</h4>
	<div>
		atom = <%=atom %><br/>
		name = <%=name %><br/>
		su1 = <%=su1 %><br/>
		su2 = <%=su2 %><br/>
		su3 + su4 = <%=(su3+su4) %><br/>
		<%-- su3 + su4 = <%=(su3*su4) %> --%>
	</div>
	<hr/>
	<div>
		<h4>EL을 이용한 출력</h4>
		<%
		request.setAttribute("atom", atom);
		pageContext.setAttribute("name", name);
		pageContext.setAttribute("su1", su1);
		pageContext.setAttribute("su2", su2);
		pageContext.setAttribute("su3", su3);
		pageContext.setAttribute("su4", su4);
		%>
		atom = ${atom}<br/>
		name = ${name}<br/>
		su1 = ${su1}<br/>
		su2 = ${su2}<br/>
		su3 + su4 = ${(su3+su4)}<br/>
		su3 * su4 = ${(su3*su4)}
	</div>
	<hr/>
	<h4>파라메터를 통해서 넘어온 값의 처리(QueryString형식)</h4>
	<div>Form태그의 get/post 방식의 전송이나, url을 통한 전송(주소?변수1=값1&변수2=값2...) 되는 값의 처리</div>
	<div>주소 창에 현재 주소 뒤에 '?mbc=200&kbs=50'을 입력후 아래내용을 확인하시오.<br/>
		mbc = ${param.mbc}<br/>
		kbs = ${param.kbs}<br/>
		mbc - kbs = ${param.mbc - param.kbs}<br/>
	</div>
	<hr/>
	<div>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/j0429/ELTest">
			<h2 class="text-center mb-5">폼 자료 연습</h2>
			<div>성명: 
				<input type="text" name="name" value="홍길동" class="form-control mb-3" />
			</div>
			<div>취미: 
				<input type="checkbox" name="hobby" value="영화" checked />영화 &nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="게임" />게임 &nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="독서" />독서 &nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="음악듣기" />음악듣기 &nbsp;&nbsp; 
				<input type="checkbox" name="hobby" value="댄스" />댄스 &nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="그림" />그림
			</div>
			<div>
				<input type="submit" value="전송" class="btn btn-success form-control mt-3" />
			</div>
		</form>
	</div>
	<hr/>
<%
	// EL로는 비교를 할 수 없어서 사용한 코드
	name = request.getParameter("name")==null ? "" : request.getParameter("name");
	if(!name.equals("")){
%>
	<p>성명: ${name}</p>	
	<p>취미: ${hobby}</p>	
<%} %>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>