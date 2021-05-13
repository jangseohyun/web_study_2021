<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 데이터 수신
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String cal = request.getParameter("cal");
	
	int n1 = 0;
	int n2 = 0;
	String result = "";
	
	try
	{	
		// 연산 처리
		n1 = Integer.parseInt(num1);
		n2 = Integer.parseInt(num2);
		
		if (cal.equals("+"))
			result = String.valueOf(n1+n2);
			//result = String.format("%d + %d = %d", n1, n2, (n1+n2));
		else if (cal.equals("-"))
			result = String.valueOf(n1-n2);
			//result = String.format("%d - %d = %d", n1, n2, (n1-n2));
		else if (cal.equals("*"))
			result = String.valueOf(n1*n2);
			//result = String.format("%d * %d = %d", n1, n2, (n1*n2));
		else if (cal.equals("/"))
			result = String.format("%.f",n1,n2,(n1/(double)n2));
			//result = String.format("%d / %d = %.1f", n1, n2, (n1/(double)n2));
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 결과 데이터 재전송 → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	// 『sendRedirect(String location)』
	//   : 지정된 URL(location)로 요청을 재전송한다.
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&cal="+cal+"&result="+result);
	
	//pageContext.getSession().setAttribute("num1",num1);
	//pageContext.getSession().setAttribute("num2",num2);
	//pageContext.getSession().setAttribute("result",result);
	
%>