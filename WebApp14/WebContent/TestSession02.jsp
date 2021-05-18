<%-- WebApp14 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (TestSession01.jsp 페이지로부터)
	// → userName, userBirth
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");

	session.setAttribute("userName",userName);
	session.setAttribute("userBirth",userBirth);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	function sendIt()
	{
		var f = document.forms[0];
		
		if (!f.userId.value)
		{
			alert("아이디 입력");
			f.userId.focus();
			return;
		}
		
	      
	    if(!f.userPwd.value)
	    {
	       alert("패스워드 입력");
	       f.userPwd.focus();
	       return;
	    }
		
		f.submit();
	}

</script>
</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02)</h1>
	<hr>
</div>

<div>
	<!-- <form action="TestSession03.jsp?userName=<%=userName %>&userBirth=<%=userBirth %>" method="post"> -->
	<form action="TestSession03.jsp" method="post">
		<%--<input type="hidden" name="userName" value="<%=userName %>">
		<input type="hidden" name="userBirth" value="<%=userBirth %>"> --%>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" name="userPwd" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" style="width: 100%;" onclick="sendIt()">전송</button>
				</th>
			</tr>
		</table>
	</form>
</div>

</body>
</html>