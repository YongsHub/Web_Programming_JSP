<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("username", request.getParameter("username"));
%>
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<H2>상품 선택</H2><HR>
	<form name="form1" method="POST" action="add.jsp">
		<select name="product">
			<option>사과</option>
			<option>귤</option>
			<option>파일애플</option>
			<option>레몬</option>
		</select>
		<input type="submit" value="추가"/>
	</form>
	<a href="checkOut.jsp">계산</a><BR>
	<a href="clear.jsp">세션 해제</a>
</div>

</body>
</html>