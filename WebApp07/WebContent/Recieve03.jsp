<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String nStr1 = request.getParameter("n1");
	String nStr2 = request.getParameter("n2");
	String cal = request.getParameter("cal");
	int n1 = 0;
	int n2 = 0;
	int result = 0;
	
	try
	{
		n1 = Integer.parseInt(nStr1);	
		n2 = Integer.parseInt(nStr2);	
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	if (cal.equals("plus"))
		result = n1 + n2;
	else if (cal.equals("minus"))
		result = n1 - n2;
	else if (cal.equals("multiply"))
		result = n1 * n2;
	else if (cal.equals("divide"))
		result = n1 / n2;
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
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<h2>연산 확인</h2>
	입력하신 <%=n1 %>과 <%=n2 %>의 연산 결과는 <%=result %> 입니다.
</div>

</body>
</html>