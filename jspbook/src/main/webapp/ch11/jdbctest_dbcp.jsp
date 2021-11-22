<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%  
	Connection Conn = null;
	PreparedStatement pstmt = null;
   try{
      Context initContext = new InitialContext();
      Context envContext = (Context)initContext.lookup("java:/comp/env");
      DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
      
      
      Conn=ds.getConnection();
      
      
      if(request.getParameter("username") != null){
    	 String sql = "insert into jdbc_test values(?,?)";
    	 pstmt = Conn.prepareStatement(sql);
    	 pstmt.setString(1, request.getParameter("username"));
         pstmt.setString(2, request.getParameter("email"));
         pstmt.executeUpdate();
      }
   } catch(Exception e){
      System.out.println(e);
   }
%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>JDBC TEST JSP</title>
</head>

<body>
   <div align = "center">
      <H2>이벤트 등록 : DBCP</H2>
      <HR>
      <form name=form1 method=POST>
         등록이름: <input type=TEXT name=username>
         주소: <input type=text name=email size=20>
         <input type=submit value="등록">
      </form>
   </div>
   #등록 목록<P>
   <%
      try{
         String sql="select username, email from jdbc_test";
         pstmt = Conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         int i = 1;
         
         while(rs.next()){
            out.println(i + ":" + rs.getString(1) + "," + rs.getString(2) + "<BR>");
            i++;
         }
         
         rs.close();
         pstmt.close();
         Conn.close();
      } catch(Exception e){
         System.out.println(e);
      }
   %>
</body>
</html>