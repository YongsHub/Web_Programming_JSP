<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP test</title>
</head>
<body>
	<div align=center>
	<sql:query var="rs" dataSource="jdbc/mysql">
		select username, email from jdbc_test
	</sql:query>
	<h2>결과 출력</h2>
	<HR>
	<c:forEach var="row" items="${rs.rows}">
	이름 : ${row.username}<br/>
	이메일 : ${row.email}
	<HR>
	</c:forEach>
	</div>
</body>
</html>