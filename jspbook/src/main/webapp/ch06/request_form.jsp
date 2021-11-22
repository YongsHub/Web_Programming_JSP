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
<H2>Request 테스트 폼</H2>
	<form name=form1 method=post action=request_result.jsp>
	<table>
	<tr>
		<td>계정</td>
		<td><input type=text size=10 name=userid></td>
	</tr><tr>
		<td>암호</td>
		<td><input type=text size=10 name=password></td>
	</tr><tr>
		<td colspan=2 align=center>
		<input type=submit value="확인">
		<input type=reset value="취소">
		</td>
	</tr>
	</table>
	</form>
</div>
</body>
</html>