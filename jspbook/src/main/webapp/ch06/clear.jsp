<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clear</title>
</head>
<body>
<%
	ArrayList<String> list = (ArrayList)session.getAttribute("productlist");
	if(list==null){
		out.println("선택상품이 없습니다.");
	}else{
		session.invalidate();
		out.println("세션이 해제되었습니다.");
	}
%>
</body>
</html>