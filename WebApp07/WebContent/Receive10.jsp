<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10</title>
<link rel="stylesheet" type="text/css" href ="css/main.css">
</head>
<body>

<div>
   <h1>데이터 송수신 실습 10</h1>
   <hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive10.jsp)</h2>
</div>

<div>
	<p>이름: <%=userName %></p>
	<p>내용: <%=message %></p>
</div>

</body>
</html>