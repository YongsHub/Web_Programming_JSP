<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		사진: <input type="file" name="file">
		<input type="submit" value="Upload"><br>
	</form>
</body>
</html>