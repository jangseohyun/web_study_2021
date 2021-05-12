<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String calendar = "";
	
	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);
	int nalsu = 0;
	
	String monthChangePre = request.getParameter("pre");
	String monthChangePos = request.getParameter("pos");
	int monthChange = 0;
	
	out.print(monthChangePre);
	
	if (monthChangePre != null)
		monthChange = -1;
	else if (monthChangePos != null)
		monthChange = 1;
	
	month += monthChange;
	
	if (month == 0)
		month = 12;
	else if (month == 13)
		month = 1;
	
	int selectYear = year;
	int selectMonth = month;
	
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
	   months[1]=29;
	} 
	
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	  
	for(int i=0; i<selectMonth-1; i++)
	{
	   nalsu += months[i];
	}
	nalsu++;
	  
	int startWeek = nalsu%7;
	int lastDay = months[month-1]; 
	
	String[] weeks = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	calendar += "<table border='1'>";
	calendar += "<tr>";
	
	for (int i=0; i<weeks.length; i++)
	{
		if (i==0)
			calendar += "<th style='color:red;'>" + weeks[i] + "</th>";
		else if (i==6)
			calendar += "<th style='color:blue;'>" + weeks[i] + "</th>";
		else
			calendar += "<th>" + weeks[i] + "</th>";		
	}
	
	calendar += "</tr>";
	calendar += "<tr>";
	
	for (int i=1; i<=startWeek; i++)
		calendar += "<td></td>";
	
	for (int i=1; i<=lastDay; i++)
	{
		startWeek++;
		
		if (selectYear == year && selectMonth == month && i == day && startWeek % 7 == 0)
			calendar += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear == year && selectMonth == month && i == day && startWeek % 7 == 1)
			calendar += "<td class='nowSun'>" + i + "</td>";
		else if (selectYear == year && selectMonth == month && i == day)
			calendar += "<td class='now'>" + i + "</td>";
		else if (startWeek % 7 == 0)
			calendar += "<td class='sat'>" + i + "</td>";
		else if (startWeek % 7 == 1)
			calendar += "<td class='sun'>" + i + "</td>";
		else
			calendar += "<td>" + i + "</td>";
		
		if (startWeek % 7 == 0)
			calendar += "</tr><tr>";
	}
	
	for (int i=0; i<=startWeek; i++, startWeek++)
	{
		if (startWeek % 7 == 0)
			break;
		
		calendar += "<td></td>";
	}
	
	calendar += "</tr>";
	calendar += "</table>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendandReceive08</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 구성하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   
	   ◀ 2021 년 5 월 ▶
	   
	   -------------------------
	   -------------------------
	   
	   - 『◀』이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	   
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive08.jsp

	○ SendAndReceive08.jsp
	
 -->

<div>
   <h1>데이터 송수신 실습 08</h1>
   <hr>
</div>

<div>
	<a href="SendAndReceive08.jsp?year=<%=year %>&month=<%=month %>">◀</a>
	&nbsp<%=year %> 년 <%=month %> 월&nbsp
	<a href="SendAndReceive08.jsp?year=<%=year %>&month=<%=month %>">▶</a>
</div>

<div>
	<br><%=calendar %>
</div>

</body>
</html>