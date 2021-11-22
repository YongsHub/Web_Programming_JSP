<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>compare forward with sendRedirect</title>
</head>
<body>
	<div align="center">
	<form method=post action=forward_action.jsp>
		forward 액션: <input type=text name=username>
		<input type=submit value="확인">
	</form>
	<form method=post action=response_sendRedirect.jsp>
		response.sendDirect:<input type=text name=username>
		<input type=submit value="확인">
	</form>
	</div>
</body>
</html>