<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/login.css">
</head>
<body>
<div align="center">
	<form class="box" action="http://localhost:8080/taeyong_free/UserServlet?cmd=profile" method="post" enctype="multipart/form-data">
		<div align="center" class="head">
		<i class="fas fa-camera-retro">프로필 수정</i>
		</div>
		<input type="text" name="userID" value="<%=application.getAttribute("userID")%>" readonly>
		<input type="file" name="file">
		<input type="text" name="text" placeholder="소개글 수정">
		<input type="submit" name="submit" value="수정하기">
	</form>
</div>


<div align="center">
	<form class="box2" action="http://localhost:8080/taeyong_free/UserServlet?cmd=delete" method="post">
		<input type="text" name="userID" value="<%=application.getAttribute("userID")%>" readonly>
		<input type="submit" name="submit" value="게시물 삭제하기">
	</form>
</div>
</body>
</html>