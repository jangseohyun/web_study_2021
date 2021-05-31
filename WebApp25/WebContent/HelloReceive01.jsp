<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive01.jsp</title>
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloRecieve01.jsp</h2>
	<hr>
</div>

<div>
	<ul>
		<li><b>First Name: </b><%=firstName %></li>
		<li><b>Last Name: </b><%=lastName %></li>
	</ul>
</div>

</body>
</html>