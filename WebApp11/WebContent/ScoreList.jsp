<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreList_WebApp11
	
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	try
	   {
	      dao = new ScoreDAO();
	      
	      str.append("<table class='table'>");
	      str.append("<tr>");
	      str.append("<th>번호</th><th>이름</th>");
	      str.append("<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
	      str.append("<th>총점</th><th>평균</th>");
	      str.append("</tr>");
	      
	      for(ScoreDTO score : dao.lists())
	      {
	    	 double avg = Double.parseDouble(score.getAvg());
	    	 
	         str.append("<tr>");
	         str.append("<td class='scoreTd'>" + score.getSid() + "</td>");
	         str.append("<td class='scoreTd'>" + score.getName() + "</td>");
	         str.append("<td class='scoreTd'>" + score.getKor() + "</td>");
	         str.append("<td class='scoreTd'>" + score.getEng() + "</td>");
	         str.append("<td class='scoreTd'>" + score.getMat() + "</td>");
	         str.append("<td class='scoreTd'>" + score.getTot() + "</td>");
	         str.append("<td class='scoreTd'>" + String.format("%.1f",avg) + "</td>");
	         str.append("</tr>");
	      }
	      str.append("");
	      str.append("</table>");
	   }
	   catch(Exception e)
	   {
	      System.out.println(e.toString());
	   }
	   finally
	   {
	      try
	      {
	         dao.close();
	      }
	      catch(Exception e)
	      {
	         System.out.println(e.toString());
	      }
	   }
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input {width: 200px; border-radius: 6px;}
	button {width: 408px; height: 50px; font-family: 맑은 고딕; font-weight: bold;}
	.record {text-align: center;}
	.errMsg {color: red; font-size: samll; display: none;}
	.scoreTd {text-align: center;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("userKor");
		var uEng = document.getElementById("userEng");
		var uMat = document.getElementById("userMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.style.display = "inline";
			return false;
		}
		
		if (uKor.value == "" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		
		if (uEng.value == "" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
	
		if (uMat.value == "" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<div>
	<h1>데이터베이스 연동 성적관리 실습</h1>
	<hr>
</div>

<div>
	<h2>DAO, DTO 개념 적용</h2>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th style="width: 80px;">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="userKor">
					<span class="errMsg" id="korMsg">0에서 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="userEng">
					<span class="errMsg" id="engMsg">0에서 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="userMat">
					<span class="errMsg" id="matMsg">0에서 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="성적 추가" class="btn" style="width: 280px; height: 50px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<div>
		<%=str.toString() %>
	</div>
</div>

</body>
</html>