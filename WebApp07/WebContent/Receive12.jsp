<%@ page contentType="text/html; charset=UTF-8"%>
<%
 
	//String num1 = (String)pageContext.getSession().getAttribute("num1");
	//String num2 = (String)pageContext.getSession().getAttribute("num2");
	//String result = (String)pageContext.getSession().getAttribute("result");

 	String num1 = request.getParameter("num1");
 	String num2 = request.getParameter("num2");
 	String cal = request.getParameter("cal");
 	String result = request.getParameter("result");
 	
 	String resultStr = String.format("%s %s %s = %s",num1,cal,num2,result);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recieve12</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Recieve12.jsp)</h2>
	정수1: <%=num1 %><br>
	정수2: <%=num2 %><br><br>
	연산 결과: <%=resultStr %>
</div>

</body>
</html>