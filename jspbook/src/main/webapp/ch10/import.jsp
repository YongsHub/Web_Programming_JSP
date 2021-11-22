<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 실습</title>
</head>
<body>
<c:import url="set.jsp" var="myurl"/>
<c:out value="${myurl}" escapeXml="false"/>
<HR>

<c:import url="https://www.github.com" var="myurl2"/>
<c:out value="${myurl2}" escapeXml="false"/>
</body>
</html>