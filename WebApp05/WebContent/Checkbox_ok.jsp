<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	String[] lover = request.getParameterValues("lover");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Checkbox.jsp ● → Checkbox_ok.jsp</p>
</div>

<div>
	<form>
		이름: <%=name %><br>
		메모: <%=memo %><br>
		이상형: 
		<%
			for (String str : lover)
				out.print(str + " ");
		%>
	</form>
</div>

</body>
</html>