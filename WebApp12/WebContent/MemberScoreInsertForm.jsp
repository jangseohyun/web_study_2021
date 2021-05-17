<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (MemberScoreSelect.jsp로부터)
	String sid = request.getParameter("sid");
	String name = "";
	
	// name을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 수신한 sid를 활용하여 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

	function memberScoreSubmit()
	{
		// 테스트
		//alert("함수 호출 확인");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(kor.value=="" || isNan(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		if(eng.value=="" || isNan(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if(mat.value=="" || isNan(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// submit 액션 수행
		memberScoreForm.submit()
	}
	
	function memberScoreReset()
	{
		// 테스트
		//alert("취소 버튼 클릭");
		
		
	}

</script>
</head>
<body>

<!-- http:localhost:8090/WebApp12/MemberScoreInsertForm.jsp -->

<div>
	<h1>회원 명단 관리 및 <span style="color: green;">입력</span> 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>

<br>

<div>
   <!-- 회원 성적 입력 폼 구성 -->
   <form action="MemberScoreInsert.jsp" method="post" id="memberScoreForm">
   	<table class="table">
   		<tr>
   			<th>번호</th>
   			<td>
   				<%=sid %>
   			</td>
   			<td>
   				<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
   			</td>
   		</tr>
   		<tr>
   			<th>이름</th>
   			<td>
   				<%=name %>
   			</td>
   		</tr>
   		<tr>
   			<th>국어점수</th>
   			<td>
   				<input type="text" id="kor" name="kor" class="txtScore">
   			</td>
   			<td>
   				<span class="errMsg" id="korMsg">0 ~ 100 사이의 국어 점수를 입력해야 합니다.</span>
   			</td>
   		</tr>
   		<tr>
   			<th>영어점수</th>
   			<td>
   				<input type="text" id="kor" name="eng" class="txtScore">
   			</td>
   			<td>
   				<span class="errMsg" id="engMsg">0 ~ 100 사이의 영어 점수를 입력해야 합니다.</span>
   			</td>
   		</tr>
   		<tr>
   			<th>수학점수</th>
   			<td>
   				<input type="text" id="kor" name="mat" class="txtScore">
   			</td>
   			<td>
   				<span class="errMsg" id="matMsg">0 ~ 100 사이의 수학 점수를 입력해야 합니다.</span>
   			</td>
   		</tr>
   	</table>
   	<br>
   	
   	<a href="javascript:memberScoreSubmit()"><button type="button">입력하기</button></a>
   	<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
   	<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
   	
   </form>
</div>

</body>
</html>