<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	String calendar = "";
	int n = 1;
	int blank = 1;
	
	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);
	int nalsu = 0;
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = year;
	int selectMonth = month;
	
	// 페이지 최초 요청이 아닐 경우
	// → 수신한 데이터로 표시할 달력의 년, 월 구성
	if (yearStr != null || monthStr != null)
	{
		selectYear = Integer.parseInt(yearStr);
		selectMonth = Integer.parseInt(monthStr);
	}
	
	// 확인한 날짜로 년도 select option 구성
	/*
	<option value="2031">2031</option>
	<option value="2030">2030</option>
	...
	<option value="2021" selected>2021</option>
	...
	<option value="2012">2012</option>
	<option value="2011">2011</option>
	*/
	
	// 확인한 날짜로 년도 select option 구성
	String yOptions = "";
	
	for (int y=(selectYear-10); y<=(selectYear+10); y++)
	{
		// 상황1. 페이지 최초 요청일 때 → yearStr 은 null 이면서 현재 년도와 옵션값이 같을 때
		if (yearStr==null && y==year)
			yOptions += "<option value'" + y + "' selected='selected'>" + y + "</option>";
		// 상황2. 페이지 최초 요청이 아닐 때
		else if (yearStr!=null && Integer.parseInt(yearStr)==y)
			yOptions += "<option value'" + y + "' selected='selected'>" + y + "</option>";
		// 상황3. 나머지
		else
			yOptions += "<option value'" + y + "'>" + y + "</option>";
	}
	
	// 확인한 날짜로 월 select option 구성
	String mOptions = "";
	
	for (int m=1; m<=12; m++)
	{
		// 상황1. 페이지 최초 요청일 때 → monthStr 은 null 이면서 현재 년도와 옵션값이 같을 때
		if (monthStr==null && m==month)
			mOptions += "<option value='" + m + "' selected='selected'>" + m + "</option>";
		// 상황2. 페이지 최초 요청이 아닐 때
		else if (monthStr!=null && Integer.parseInt(monthStr)==m)
			mOptions += "<option value='" + m + "' selected='selected'>" + m + "</option>";
		// 상황3. 나머지
		else
			mOptions += "<option value='" + m + "'>" + m + "</option>";	
	}
	   
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
	   months[1]=29;
    } 
	
	// 총 날수 누적 변수 nalsu
	// 현재년도 → 입력받은 년도의 이전 년도까지의 날수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	  
	// 현재월 → 입력받은 월이 이전 월까지의 날수 추가
	for(int i=0; i<selectMonth-1; i++)
	{
	   nalsu += months[i];
	}
	nalsu++;
	  
	// 1일의 요일 변수
	int startWeek = nalsu%7;
	// 마지막 날짜 변수
	int lastDay = months[month-1]; 
	
	// 달력 그리기(내가 했던 것)
	/* 	
	for (int i=1; i<=6; i++)
	{
		calendar += "<tr>";
		
		for (int j=1; j<=7; j++)
		{
			if (blank <= startWeek)
			{
				calendar += "<td></td>";
				blank++;
			}
			else if (n<=lastDay)
			{
				calendar += "<td>"+n+"</td>";
				n++;
			}
		}
		calendar += "</tr>";
	}
	 */
	
	// 강사님 풀이
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
	
	// 빈 칸 공백 td 발생
	for (int i=1; i<=startWeek; i++)
		calendar += "<td></td>";
	
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		//calendar += "<td>" + i + "</td>";
		
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
	
	// 빈칸 공백 td 발생
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
<title>SendandReceive07</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
<script type="text/javascript">

	function objSubmit(obj)	// obj는 form 객체
	{		
		obj.submit();
	}

</script>
</head>
<body>

<!-- 
	- 달력을 출력하는 JSP 페이지를 구성한다.
	- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	- 단, submit 버튼 없이 이벤트 처리를 한다.
	- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다. (단독 페이지)
	- 연도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	- 월은 1부터 12월까지로 구성한다.
	
	[ 2021 ▼ ] 년 [ 5 ▼ ] 월
	
	--------------------------
	--------------------------
	
	- 연도 select box나 월 select box 내용 변화 시
	  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	
	- 현재 날짜를 확인하는 과정에서 Calendar 클래스를 활용한다.
	
	- 사용자 최초 요청 주소는
	  http://localhost:8090/WebApp07/SendAndReceive07.jsp
	  로 한다.

	○ SendAndReceive07.jsp
	
 -->
 
<div>
   <h1>데이터 송수신 실습 07</h1>
   <hr>
</div>

<div>
	<!-- form의 action 속성 값 생략 → 데이터의 수신처는 자기 자신(요청하는 페이지도 자기 자신)-->
	<form action="" method="post">
		<select name="year" id="year" onchange="objSubmit(this.form)">
			<!-- <option value="2021">2021</option> -->
			<%=yOptions %>
		</select>
		년&nbsp
		<select name="month" id="month" onchange="objSubmit(this.form)">
			<!-- <option value="5">5</option> -->
			<%=mOptions %>
		</select>
		월
		<br>
	</form>
</div>

<br>

<div>
	<!--
	<table>
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	</table>
	-->
	<%=calendar %>
</div>

</body>
</html>