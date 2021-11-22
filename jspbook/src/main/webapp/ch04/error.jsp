<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<div align="center">
	<H2>처리중 문제가 발생했습니다.</H2>
	<table>
		<tr bgcolor="pink">
			<td>
			관리자에게 문의해 주세요.
			빠른시간내에 복구하겠습니다.
			<HR>
			<%= exception %>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>