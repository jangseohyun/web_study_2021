<%@ page contentType="text/html; charset=UTF-8"%>
<%
/* 
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
 */
 
	// 이전 페이지(Send03.html)로부터 데이터 수신
	String num1Str = request.getParameter("num1");
 	String num2Str = request.getParameter("num2");
 	String op = request.getParameter("op");
 	
 	String result = "";
 	int num1 = 0;
 	int num2 = 0;
 	
 	try
 	{
 		num1 = Integer.parseInt(num1Str);
 		num2 = Integer.parseInt(num2Str);
 		
 		if (op.equals("+"))
 			result = String.valueOf(num1+num2);
 		else if (op.equals("-"))
 			result = String.valueOf(num1-num2);
 		else if (op.equals("*"))
 			result = String.valueOf(num1*num2);
 		else if (op.equals("/"))
 			//result = String.valueOf(num1/num2);
 			//result = String.valueOf(num1/(double)num2);
 			result = String.format("%.1f", num1/(double)num2);
 		
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
<title>Receive03</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<h2>연산 확인</h2>
	입력하신 <%=num1 %>과 <%=num2 %>의 연산 결과는 <%=result %> 입니다.
</div>

</body>
</html>