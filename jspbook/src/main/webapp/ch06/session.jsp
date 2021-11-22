<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<div align="center">
<H2>SESSION 예제</H2><HR>
	<%
	if(session.isNew()){
		out.println("<script>alert('세션이 해제되어 다시 설정합니다.')</script>");
		session.setAttribute("login","강호동");
	}
	%>
	#<%= session.getAttribute("login") %>님 환영합니다.!!<BR>
	1.세션 ID: <%=session.getId() %><BR>
	2.세션 유지시간: <%=session.getMaxInactiveInterval() %><BR>
</div>
</body>
</html>