<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String vGender = request.getParameter("gender");
	String gender = "";
	String major = request.getParameter("major");
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "";
	
	if (vGender != null)
	{
		if (vGender.equals("F"))
			gender = "여자";
		else
			gender = "남자";
	}
	
	if (hobbies != null)
	{
		for (int i=0; i<hobbies.length; i++)
		{
			hobby += hobbies[i];
			
			if (i != hobbies.length-1)
				hobby += ", ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp</p>
</div>

<div>
	<form>
		<h3>이름</h3>
		<%=name %><br>
		<h3>성별</h3>
		<%=gender %><br>
		<h3>전공</h3>
		<%=major %><br>
		<h3>취미</h3>
		<%=hobby %>
	</form>
</div>

</body>
</html>