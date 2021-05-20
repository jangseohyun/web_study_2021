<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"></jsp:setProperty>
<!-- 반복문 필요(다중 선택으로 넘어온 결과값 처리) -->
<%
	String str = "";

	if (ob.getLover() != null)
	{
		for (int i=0; i<ob.getLover().length; i++)
		{
			str += ob.getLover()[i];
			
			if (i != ob.getLover().length-1)
				str += ", ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인</h2>
	<h3>이름: <%=ob.getName() %></h3>
	<h3>나이: <%=ob.getAge() %></h3>
	<h3>성별: <%=ob.getGender() %></h3>
	<h3>이상형: <%=str %></h3>
</div>

</body>
</html>