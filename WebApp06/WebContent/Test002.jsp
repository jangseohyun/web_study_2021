<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "include 디렉티브와 관련된 실습입니다.";
	String name = "장서현";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>include 디렉티브 실습</h1>
	<hr>
</div>

<%@ include file="Test003.jsp" %>

<br><br>

<div>
   <%=str %><br>
   <%=name %><br>
</div>


</body>
</html>