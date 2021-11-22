<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<H2>application result</H2>
	<HR>
	username에 설정된 값은: <%= application.getAttribute("username") %><P>
	<%
		Integer count = (Integer)application.getAttribute("count");
		int cnt = count.intValue() + 1;
		application.setAttribute("count", cnt);
	%>
	방문자 수: <%=cnt %>
</div>
</body>
</html>