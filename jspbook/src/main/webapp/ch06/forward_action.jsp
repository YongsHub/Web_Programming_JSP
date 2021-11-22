<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward</title>
</head>
<body>
	<jsp:forward page="end_page.jsp">
	<jsp:param name="phone" value="000-740-0000"/>
	</jsp:forward>
</body>
</html>