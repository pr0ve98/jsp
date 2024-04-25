<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("img");
	String[] imgs = request.getParameterValues("img2");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t08Ok.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<p><img src="<%=request.getContextPath() %>/images/<%=fileName %>.jpg" width='200px' /><%=fileName %>.jpg</p>
	<%
		if(imgs != null) {
			for(String i : imgs){
				out.println("<p><img src='"+request.getContextPath()+"/images/"+i+".jpg' width='200px'/>");
				out.println(i+".jpg</p>");
			}	
		}
	%>
</div>
<p><br/></p>
</body>
</html>