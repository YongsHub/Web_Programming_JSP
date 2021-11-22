<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include test</title>
</head>
<body>
<div align="center">
	<H2>include 지시어 테스트</H2>
	<HR>
	<%@ include file="menu.jsp" %>
	<table>
		<tr>
			<td><font size=-1><%@include file="news.jsp" %></font></td>
			<td width="20">&nbsp;</td>
			<td><font size=-1><%@include file="shopping.jsp" %></font></td>
		</tr>
	</table>
</div>
</body>
</html>