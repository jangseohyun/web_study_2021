<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String num1 = (String)request.getAttribute("num1");
	String num2 = (String)request.getAttribute("num2");
	String result = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11</title>
<link rel="stylesheet" type="text/css" href ="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
 	정수1: <%=num1 %><br>
	정수2: <%=num2 %><br><br>
	연산 결과: <%=result %>
</div>

</body>
</html>