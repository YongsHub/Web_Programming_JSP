<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkOut</title>
</head>
<body>
<div align="center">
선택한 상품 목록
<HR>
<%
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist");
	if(list==null){
		out.println("선택한 상품이 없습니다.!!!");
	}else{
		for(Object productname:list){
			out.println(productname+"<BR>");
		}
	}
%>
</div>
</body>
</html>