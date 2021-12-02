<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="kpu.web.club.persistence.FileDAO"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/profile.css">
<link rel="stylesheet" href="resources/style.css">
</head>
<body>

<sql:query var="rs" dataSource="jdbc/mysql">
		select * from file where userID = "<%=application.getAttribute("userID")%>" ORDER BY SEQ DESC;
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
		<div class="container">
			<div class="profile">
				<div class="profile-image">
				<c:forEach var="row" items="${us.rows}">
					<img src="./upload/${row.proFileImg}" alt= "User" width="150" height="150">
				</c:forEach>
				</div>
				<div class="profile-user-settings">
					<h1 class="profile-user-name"><%=application.getAttribute("userID")%>
					</h1>
					<input type="button" class="btn profile-edit-btn" value="프로필 수정" onclick="location.href='http://localhost:8080/taeyong_free/edit.jsp';">
					<!-- <input type="file" name="file" id="file" style="display: none;"/> -->
				</div>
				<div class="profile-bio">
					<c:forEach var="row" items="${us.rows}">
						<p><span class="profile-real-name">${row.userID}</span><br>${row.text}</p>
					</c:forEach>
				</div>
			</div>
			<!--  End Of Profile Section -->
		</div>
		<!--  End Of Container -->
	</header>
	<main>
		<div class="gallery">
			<c:forEach var="row" items="${rs.rows}">
				<div class="gallery-item" tabindex="0">
				 실제 이름: ${row.fileName}
				<img src="./upload/${row.fileName}" alt="Gallery-1" class="gallery-image">
				<div class="gallery-item-type">
					<span class="visually-hidden">Gallery</span>
					<i class="fas fa-clone" aria-hidden></i>
				</div>
				<div class="gallery-item-info">
					<ul>
						<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i>게시물</li>
					</ul>
				</div>
				</div>
			</c:forEach>
		</div>
		<!-- End Of Gallery -->
	</main>
</body>
</html>