<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	<%
	for (int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>