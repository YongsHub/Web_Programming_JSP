<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/ItemTag.tld" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Item Tag Test</title>
</head>
<body>
	<div align="center">
	<H2>태그 핸들러 예제-Product Item</H2>
	<HR>
	<mytag:item border="5" bgcolor="yellow">상품 목록</mytag:item>
	</div>
</body>
</html>