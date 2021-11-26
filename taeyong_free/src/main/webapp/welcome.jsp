<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kpu.web.club.domain.UserVO"%>
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
<title>KPU SNS WEB PAGE</title>

</head>

<body>
	<%
	String userID = (String)request.getAttribute("userID");
	
	if(userID==null){
		userID = null;
	}else{
		application.setAttribute("userID", userID);
	}
	%>
	
	<sql:query var="rs" dataSource="jdbc/mysql">
		select * from file ORDER BY SEQ DESC;
	</sql:query>
	<sql:query var="us" dataSource="jdbc/mysql">
		select * from sns_user where id = "<%=application.getAttribute("userID")%>";
	</sql:query>
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
	<header>
		<div class="header__top--icons">
			
		</div>
	</header>
	<section class="posts">
		<c:forEach var="row" items="${rs.rows}">
			<div class="post">
				<div class="post__header">
					<div class="post__user">
						<div class="post__user--pp">
							<c:forEach var="profile" items="${us.rows}">
								<img src="./upload/${profile.fileName}">
							</c:forEach>
						</div>
						<div class="post__user--un">${row.userID}</div>
					</div>
				</div>
				<div class="post__content">
					<img src="./upload/${row.fileName}">
				</div>
				<div class="post__icons">
					<i class="fas fa-image"></i>
					<i class="fas fa-camera"></i>
				</div>
				<div class="post__text">
					<p><span class="username">${row.userID}</span><span class="hashtag">${row.postText}</span></p>
				</div>
			</div>		
		</c:forEach>	
	</section>
</body>
</html>