<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String str = "";

	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table><tr><td>번호</td><td>이름</td><td>국어점수</td><td>영어점수</td><td>수학점수</td><td>총점</td><td>평균</td></tr>";
	
	int tot = 0;
	double avg = 0;
	
	while (rs.next())
	{
		tot = rs.getInt("KOR") + rs.getInt("ENG") + rs.getInt("MAT");
		avg = tot / 3.0;
		
		str += "<tr>";
		str += "<td>"+rs.getString("SID")+"</td>";
		str += "<td>"+rs.getString("NAME")+"</td>";
		str += "<td>"+rs.getString("KOR")+"</td>";
		str += "<td>"+rs.getString("ENG")+"</td>";
		str += "<td>"+rs.getString("MAT")+"</td>";
		str += "<td>"+tot+"</td>";
		str += "<td>"+String.format("%.1f",avg)+"</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList_1</title>
</head>
<body>

<div>
	<h1>성적 처리 실습</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post">
		<table>
			<tr>
				<td>이름(*)</td>
				<td>
					<input type="text" id="name" name="name" class="txt">
				</td>
			</tr>
			<tr>
				<td>국어점수</td>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
				</td>
			</tr>
			<tr>
				<td>영어점수</td>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
				</td>
			</tr>
			<tr>
				<td>수학점수</td>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp</td></tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnSubmit" class="btn" style="width: 180px;">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<%=str %>
</div>

</body>
</html>