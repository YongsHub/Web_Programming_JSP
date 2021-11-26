<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kpu.web.club.persistence.FileDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/style.css">
<link href="https://fonts.googleapis.com/css2?family=M+PLUS+2:wght@300&family=Source+Sans+Pro:wght@300&family=Titillium+Web&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8e52ee94eb.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>


<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-camera-retro"></i>
			<a href="">KPU SNS</a>
		</div>
		
		<ul class="navbar__menu">
			<mytag:item></mytag:item>
		</ul>
		
		<ul class="navbar__icons">
			<li><i class="fab fa-facebook-square"></i></li>
		</ul>
	
	</nav>
	<div align="center">
		<%
		
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		String userID = (String)application.getAttribute("userID");
		String text = multipartRequest.getParameter("text");
		
		new FileDAO().upload(userID,fileName,fileRealName,text);
		%>
		작성이 완료되었습니다.
	</div>
</body>
</html>