<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Gugudan.jsp)로부터 데이터 수신 → 스크립트 릿 영역
	// request.getParameter() 메소드 활용 → 이름(name) 식별자
	
	String danStr = request.getParameter("dan");
	int n = 0;

	try
	{
		n = Integer.parseInt(danStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok</title>
</head>
<body>

<div>
	<h1>JSP 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<!-- HTML 주석문 -->
<%-- JSP 주석문 --%>

<%--
<%
	for (int i=1; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%=(n*i) %><br>
	<%}
%>
--%>

<%
	for (int i=1; i<=9; i++)
	{
		out.print(n + " + " + i + " = " + (n*i) + "<br>");
	}
%>

</body>
</html>