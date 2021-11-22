<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 결과</title>
</head>
<body>
<div align="center">
	<table>
		<tr>
			<td>계정</td>
			<td><%=request.getParameter("userid") %></td>
		</tr>
		<tr>
			<td>암호</td>
			<td><%=request.getParameter("password") %></td>
		</tr>
		<tr>
			<td>클라이언트 IP주소</td>
			<td><%=request.getRemoteAddr() %></td>
		</tr>
	</table>
</div>
</body>
</html>