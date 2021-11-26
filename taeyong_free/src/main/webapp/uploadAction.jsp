<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form class="box" action="upload.jsp" method="post" enctype="multipart/form-data">
		사진: <input type="file" name="file"> <br>
		<input type="text" name="text" placeholder="해쉬태그">
		<input type="submit" value="Upload"><br>
		</form>
	</div>
</body>
</html>