<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Property</title>
</head>
<body>
	<jsp:useBean id="calc" class="jspbook.ch02.CalcBean"/>
	<jsp:setProperty name="calc" property="num1" value="10"/>
	<jsp:setProperty name="calc" property="num2" value="5"/>
	<jsp:setProperty name="calc" property="operator" value="*"/>
	<%calc.calculate(); %>
	<p>계산 결과: <%out.println(calc.getResult()); %>
	<p>계산 결과: <jsp:getProperty name="calc" property="result"/>
</body>
</html>