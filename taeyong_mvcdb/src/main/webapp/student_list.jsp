<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*, java.util.List"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
<header>Member List</header>
<hr>
<div>
	<a href="http://localhost:8080/taeyong_mvcdb/StudentServlet?cmd=main"target="_self">메인 페이지 이동</a>  
</div>
<br><br>
<table border="1">
	
	<%
		List<StudentVO> studentList = (List<StudentVO>)request.getAttribute("studentList");
		for(StudentVO vo : studentList){
	%>
	
	<tr>
   			<td>아이디</td>
   			<td>이름</td>
   			<td>학번</td>
   			<td>학과</td>
   			<td>휴대폰</td>
   			<td>이메일</td>
   		</tr>
   		<tr>
   			<td><a href="http://localhost:8080/taeyong_mvcdb/StudentServlet?cmd=update&id=<%=vo.getId() %>"target="_self"><%=vo.getId() %></a></td>
   			<td><%=vo.getUsername()%></td>
   			<td><%=vo.getSnum() %></td>
   			<td><%=vo.getDepart() %></td>
   			<td><%=vo.getMobile() %></td>
   			<td><%=vo.getEmail() %></td>
   		</tr>
	<%
		}
		request.setAttribute("studentList",studentList);
	%>
</table>
</body>
</html>