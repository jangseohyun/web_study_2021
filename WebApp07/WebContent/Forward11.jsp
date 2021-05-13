<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String cal = request.getParameter("calResult");
	
	int n1 = 0;
	int n2 = 0;
	String result = "";
	
	try
	{
		n1 = Integer.parseInt(num1);
		n2 = Integer.parseInt(num2);
		
		if (cal.equals("1"))
			result = String.format("%d + %d = %d", n1, n2, (n1+n2));
	 	else if (cal.equals("2"))
			result = String.format("%d - %d = %d", n1, n2, (n1-n2));
	 	else if (cal.equals("3"))
			result = String.format("%d * %d = %d", n1, n2, (n1*n2));
	 	else if (cal.equals("4"))
			result = String.format("%d / %d = %.1f", n1, n2, (n1/(double)n2));
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
 	request.setAttribute("num1",num1);
	request.setAttribute("num2",num2);
	request.setAttribute("result",result);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11</title>
</head>
<body>

<div>
	<jsp:forward page="Receive11.jsp"></jsp:forward>
</div>

</body>
</html>