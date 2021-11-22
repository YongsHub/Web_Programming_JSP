<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   String jdbc_driver = "com.mysql.cj.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
   ArrayList<String> list = new ArrayList<String>();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<H2>테이블 student에서 이름으로 조회하는 프로그램</H2>
	<HR>
	<p>학생 정보 조회<br>
	<%
      try{
    	 Class.forName(jdbc_driver);
         conn = DriverManager.getConnection(jdbc_url, "jspbook", "rlaxodyd628@");
         StringBuilder sb = new StringBuilder(); 
         //String sql = "select * from student";
         String sql = sb.append("select * from student where username = '").append(request.getParameter("username")).append("';").toString();
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         int i = 1;
         
         
         
         while(rs.next()){
        	list.add(rs.getString(1));
        	list.add(rs.getString(2));
        	list.add(rs.getString(3));
        	list.add(rs.getString(4));
        	list.add(rs.getString(5));
        	list.add(rs.getString(6));
        	list.add(rs.getString(7));
            //out.println(i + ":" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + ","+ rs.getString(4) + "," + rs.getString(5) + "," + rs.getString(6) + "," + rs.getString(7) + "<BR>");
            //i++;
         }
         
         rs.close();
         pstmt.close();
         conn.close();
      } catch(Exception e){
         System.out.println(e);
      }
   %>
   <table border="1">
   		<tr>
   			<td>아이디</td>
   			<td>암호</td>
   			<td>이름</td>
   			<td>학번</td>
   			<td>학과</td>
   			<td>휴대폰</td>
   			<td>이메일</td>
   		</tr>
   		<tr>
   			<td><%out.println(list.get(0));%></td>
   			<td><%out.println(list.get(1)); %></td>
   			<td><%out.println(list.get(2)); %></td>
   			<td><%out.println(list.get(3)); %></td>
   			<td><%out.println(list.get(4)); %></td>
   			<td><%out.println(list.get(5)); %></td>
   			<td><%out.println(list.get(6)); %></td>
   		</tr>
   </table>
   <HR>
</div>
</body>
</html>