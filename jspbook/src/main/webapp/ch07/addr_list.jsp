<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch07.*"%>
<!DOCTYPE html>
<jsp:useBean id="adao" class="jspbook.ch07.AddrDAO" scope="application"/>
<html>
<head>
	<title>addr list jsp</title>
</head>
<body>
	<div align="center">
	<H2>주소록</H2>
	<HR>
	<a href="addr_form.html">주소추가</a><p>
		<table border=1 width=500>
			<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td></tr>
			<%
				for(AddrVO vo : adao.getAddrList()){
			%>
				<tr>
				<td><%=vo.getUsername() %>
				<td><%=vo.getTel() %>
				<td><%=vo.getEmail() %>
				<td><%=vo.getSex() %>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>