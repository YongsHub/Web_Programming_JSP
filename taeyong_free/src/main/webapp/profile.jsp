<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/profile.css">
</head>
<body>
<sql:query var="rs" dataSource="jdbc/mysql">
		select * from file where userID = "<%=application.getAttribute("userID")%>"
</sql:query>
	<header>
		<div class="container">
			<div class="profile">
				<div class="profile-image">
						<img src="<%="./upload/1.jpg"%>" alt= "User" width="150" height="150">
				</div>
				<div class="profile-user-settings">
					<h1 class="profile-user-name"><%=application.getAttribute("userID")%></h1>
					<button class="btn profile-edit-btn">Edit Profile</button>
					
				</div>
				<div class="profile-bio">
					<p><span class="profile-real-name"><%=application.getAttribute("userID")%></span><br>Hello</p>
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
						<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i>56</li>
						<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i>2</li>
					</ul>
				</div>
				</div>
			</c:forEach>
		</div>
		<!-- End Of Gallery -->
	</main>
</body>
</html>