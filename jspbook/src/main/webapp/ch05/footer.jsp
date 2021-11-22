<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
		footer.jsp에서 출력할 메시지입니다.
		<hr>
		<%=request.getParameter("email")%><br>
		<%=request.getParameter("tel") %>
</body>
</html>