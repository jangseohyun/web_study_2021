<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿(Scriptlet) 영역
	String name="장서현";
	name += "은 홍길동이 아니다.";
	
	int result;
	result = 10 + 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JspTest001</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>장서현</h2>
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>

</body>
</html>