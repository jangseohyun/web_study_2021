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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<body>

<div>
	<h1>실습...</h1>
	<h2>MemberList.jsp</h2>
	<hr>
</div>

<div>
	<a href="memberinsertform"><button type="button">회원 추가</button></a>
	<br><br>
</div>

<div>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="dto" items="${lists }">
		<tr>
				<td>${dto.id }</td>
				<td>${dto.pw }</td>
				<td>${dto.name }</td>
				<td>${dto.tel }</td>
				<td>${dto.email }</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>