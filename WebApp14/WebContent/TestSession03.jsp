<%-- WebApp14 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// hidden 태그로 전송했을 경우
	//String name = request.getParameter("userName");
	//String birth = request.getParameter("userBirth");
	
	String name = (String)session.getAttribute("userName");
	String birth = (String)session.getAttribute("userBirth");
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>로그인 실습</h1>
	<hr>
	<br>
</div>

<div>
	<form>
		이름: <%=name %><br>
		생일: <%=birth %><br>
		아이디: <%=id %><br>
		패스워드: <%=pwd %><br>
	</form>
</div>

</body>
</html>