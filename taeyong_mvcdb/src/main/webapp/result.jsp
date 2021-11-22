<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>가입 결과</title>
<link rel="stylesheet" href="resources/register.css" type="text/css"></link>
</head>
<body>
	<header>  2021 KPU Web Service Programming Community</header>
	<p id=sect><%=request.getAttribute("greetings") %><br></p>
	<div>
	<%
		StudentVO student = (StudentVO)request.getAttribute("student");
	%>
	<table>
		<tr><th>계정</th> <td><%=student.getId() %></td></tr>
		<tr><th>이름</th> <td><%=student.getUsername() %></td></tr>
		<tr><th>학번</th> <td><%=student.getSnum() %></td></tr>
		<tr><th>학과</th> <td><%=student.getDepart() %></td></tr>
		<tr><th>핸드폰</th> <td><%=student.getMobile() %></td></tr>
		<tr><th>이메일</th> <td><%=student.getEmail()%></td></tr>
	</table>
	</div>
	<p id=sect2>
		<a href="http://localhost:8080/taeyong_mvcdb/StudentServlet?cmd=list"target="_self">전체 회원 목록 보기</a> 
	</p>
</body>
</html>