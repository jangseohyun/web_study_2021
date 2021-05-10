<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿 영역 → 이전 페이지로부터(Checkbox.jsp) 데이터 수신
	
	// 한글 데이터 수신 시 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n","<br>");
	//--JDK 1.5 이후에서 『replaceAll()』 사용 가능
	//  『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러개를 받는(수신하는) 경우
	//    이를 배열로 처리해야 한다.
	String[] lover = request.getParameterValues("lover");
	
	// ※ 배열 데이터를 수신하여 처리할 경우
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값이 null이 되어버리기 때문에
	//    null에 대한 체크가 반드시 필요하다.
	
	String str = "";
	
	if (lover != null)
	{
		for (String item : lover)
		{
			str += " [" + item + "] ";
		}
	}
	
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
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Checkbox.jsp ● → Checkbox_ok.jsp</p>
</div>

<div>
	<form>
		<h3>이름</h3>
		<%=name %><br>
		<h3>메모</h3>
		<%=memo %><br>
		<h3>이상형</h3>
		<%=str %>
	</form>
</div>

</body>
</html>