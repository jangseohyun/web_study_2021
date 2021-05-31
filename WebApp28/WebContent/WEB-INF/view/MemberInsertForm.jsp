<%@page import="com.test.mvc.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript">

	function memberSubmit()
	{
		
		var memberForm = document.getElementById("memberForm");
		
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var name = document.getElementById("name");
		var tel = document.getElementById("tel");
		var email = document.getElementById("email");
		
		idMsg.style.display = "none";
		pwMsg.style.display = "none";
		
		if (id.value=="")
		{
			idMsg.style.display = "inline";
			id.focus();
			return;
		}
		
		if (pw.value=="")
		{
			pwMsg.style.display="inline";
			pw.focus();
			return;
		}
		
		memberForm.submit();
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");

		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var name = document.getElementById("name");
		var tel = document.getElementById("tel");
		var email = document.getElementById("email");
		
		idMsg.style.display = "none";
		pwMsg.style.display = "none";
		telMsg.style.display = "none";
		
		memberForm.reset();
		
		id.focus();
	}

</script>
</head>
<body>

<div>
	<h1>실습...</h1>
	<h2>MemberInsertForm.jsp</h2>
	<hr>
</div>

<div>
	<a href="memberlist"><button type="button">회원 명단 확인</button></a>
	<br><br>
</div>

<div>
	<form action="memberinsert" method="post" id="memberForm">
		<table class="table">
			<tr>
				<th>아이디(*)</th>
				<td><input type="text" id="id" name="id"></td>
				<td><span class="errMsg" id="idMsg">아이디를 입력하세요.</span></td>
			</tr>
			<tr>
				<th>비밀번호(*)</th>
				<td><input type="password" id="pw" name="pw"></td>
				<td><span class="errMsg" id="pwMsg">비밀번호를 입력하세요.</span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" id="tel" name="tel"></td>
				<td><span class="errMsg" id="telMsg">동일한 전화번호의 가입 이력이 존재합니다.</span></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" id="email" name="email"></td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">입력</button></a>
		<a href="javascript:memberReset()"><button type="button">취소</button></a>

	</form>
</div>

</body>
</html>