<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out Test</title>
</head>
<body>
	<table border="1" cellpadding=5 cellspacing=0>
	<a:forEach var="member" items="${members}">
	 <tr>
	 	<td><a:out value="${member.name}"/></td>
	 	<td><a:out value="${member.email}" escapeXml="false">
	 	  <font color=red>email 없음</font>
	 	  </a:out>
	 	  </td>
	</tr>
	</a:forEach>
	</table>
</body>
</html>