<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- CalcBean 클래스를 calc라는 이름으로 인스턴스 생성 --%>
<jsp:useBean id="calc" class="jspbook.ch02.CalcBean"/>
<jsp:setProperty name="calc" property="*"/>
<%calc.calculate();%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align=center>
	<H3>계산기: 빈즈 사용</H3>
	<HR>
	<form name=form1 action='calculate2.jsp' method=post>
	<input type="text" NAME="num1" width=200 size="5">
	<SELECT NAME="operator">
	<option selected>+</option>
	<option>-</option>
	<option>*</option>
	<option>/</option>
	</SELECT>
	<input type="text" NAME="num2" width=200 size="5">
	<input type="submit" value="계산" name="B1">
	<input type="reset" value ="다시 입력" name="B2">
	</form>
	<HR>
	계산결과: <jsp:getProperty name="calc" property="result"/>
	</div>
</body>
</html>