<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out</title>
</head>
<body>
<div align="center">
	<H2>out 참조 변수의 사용</H2>
	0. 남아있는 버퍼 크기: <%= out.getRemaining() %><BR>
	1. 설정된 버퍼 크기: <%= out.getBufferSize()%><BR>
	2. 남아있는 버퍼 크기: <%= out.getRemaining() %><BR>
	<%out.flush();%>
	3. flush후 남아있는 버퍼 크기: <%=out.getRemaining() %><BR>
</div>
</body>
</html>