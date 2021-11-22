<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date</title>
</head>
<body>
	<div align="center">
	<jsp:useBean id="date" class="java.util.Date"/>
	<%
		out.println("오늘의 날짜와 시간 <br>");
	%>
	<%=date%>
	</div>
</body>
</html>