<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	int tot = 0;
	double avg = 0.0;
	
	try
	{
		tot = Integer.parseInt(kor)+Integer.parseInt(eng)+Integer.parseInt(mat);
		avg = tot / 3.0;
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
<title>Receive02</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>
 
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div>
	<h2>성적 확인</h2>
	<span style="color:blue;"><%=name %></span> 님, 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어: <span style="color:blue;"><%=kor %></span>점, 영어: <span style="color:blue;"><%=eng %></span>, 수학: <span style="color:blue;"><%=mat %></span>점 입니다.
	총점은 <span style="color:blue;"><%=tot %></span>점, 평균은 <span style="color:blue;"><%=String.format("%.1f", avg) %></span>점 입니다.
</div>

</body>
</html>