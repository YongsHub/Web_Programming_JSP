<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kpu.web.club.domain.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style.css">
<link href="https://fonts.googleapis.com/css2?family=M+PLUS+2:wght@300&family=Source+Sans+Pro:wght@300&family=Titillium+Web&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8e52ee94eb.js" crossorigin="anonymous"></script>
<title>KPU SNS WEB PAGE</title>
</head>

<body>
	<%
	String userID = (String)request.getAttribute("userID");
	
	application.setAttribute("userID", userID);
	%>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-camera-retro"></i>
			<a href="">KPU SNS</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="http://localhost:8080/taeyong_free/welcome.jsp">HOME</a></li>
			<li><a href="http://localhost:8080/taeyong_free/profile.jsp">PROFILE</a></li>
			<li><a href="http://localhost:8080/taeyong_free/uploadAction.jsp">POST</a>
			<li><a href="http://localhost:8080/taeyong_free/login.html">LOG OUT</a>
		</ul>
		
		<ul class="navbar__icons">
			<li><i class="fab fa-facebook-square"></i></li>
		</ul>
	
	</nav>
	<header>
		<div class="header__top--icons">
			
		</div>
	</header>
	<section class="posts">
		<div class="post">
			<div class="post__header">
				<div class="post__user">
					<div class="post__user--pp">
						<img src="resources/dog.jpg">
					</div>
					<div class="post__user--un"><%=application.getAttribute("userID")%></div>
				</div>
			</div>
			<div class="post__content">
				<img src="<%="./upload/1.jpg"%>">
			</div>
			<div class="post__text">
				<p><span class="username"><%=application.getAttribute("userID")%></span><span class="hashtag">#안녕하세요:)</span></p>
			</div>
		</div>
		
		<div class="post">
			<div class="post__header">
				<div class="post__user">
					<div class="post__user--pp">
						<img src="resources/dog.jpg">
					</div>
					<div class="post__user--un"><%=application.getAttribute("userID")%></div>
				</div>
			</div>
			<div class="post__content">
				<img src="resources/dog.jpg">
			</div>
			<div class="post__text">
				<p><span class="username"><%=application.getAttribute("userID")%></span><span class="hashtag">#안녕하세요:)</span></p>
			</div>
		</div>
	</section>
</body>
</html>