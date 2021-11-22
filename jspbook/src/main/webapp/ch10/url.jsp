<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>url 태그 이용</title>
</head>
<body>
<c:redirect url="/ch10/choose.jsp">
	<c:param name="sel">a</c:param>
</c:redirect>
<HR>
단순 출력: ${target}<BR>
링크 연동: <a href="${target}">choose.jsp-a선택</a>
</body>
</html>