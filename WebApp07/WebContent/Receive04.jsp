<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	String gender = request.getParameter("userGender");
	String city = request.getParameter("userCity");
	String[] subjects = request.getParameterValues("userSubject");
	String subject = "";

	if (subjects != null)
	{
		for (int i=0; i<subjects.length; i++)
		{
			subject += subjects[i];
				
			if (i != subjects.length-1)
				subject += ", ";
		}
	}

	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력하는
	//  과정 등이 포함될 것임을 염두하여 작업을 진행할 수 있도록 하자

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04</title>
</head>
<body>


<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<p>아이디: <%=id %></p>
	<p>패스워드: <%=pwd %></p>
	<p>이름: <%=name %></p>
	<p>전화번호: <%=tel %></p>
	<p>성별: <%=gender %></p>
	<p>지역: <%=city %></p>
	<p>수강과목: <%=subject %></p>
</div>

</body>
</html>