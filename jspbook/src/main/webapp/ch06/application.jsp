<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 예제</title>
</head>
<body>
<div align="center">
<H2>application 예제</H2>
<HR>
1. 서버 정보: <%= application.getServerInfo() %><BR>
2. 서블릿 API 버젼정보: <%= application.getMajorVersion() + application.getMinorVersion() %><BR>
3. Application.jsp 파일 경로: <%= application.getRealPath("application.jsp") %><BR>
<HR>
setAttribute로 username 변수에 "강호동" 설정
<%
	application.setAttribute("username","강호동");
	application.log("username=강호동");
	application.setAttribute("count",1);
%>
<a href="application_result.jsp">확인하기</a>
</div>
</body>
</html>