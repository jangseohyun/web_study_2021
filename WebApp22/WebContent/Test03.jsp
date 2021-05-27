<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test03.jsp</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<body>

<div>
	<h1>JSTL 코어(Core) forEach문 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		<%-- JSTL 코어(Core) 반복문 --%>
		<%-- 『<c:forEach var="변수" begin="시작점" end="끝값" step="증가값"></c:forEach>』 --%>
		<c:forEach var="a" begin="1" end="9" step="1">
		<tr>
			<c:forEach var="b" begin="1" end="9" step="1">
			<td style="width: 20px;">
				${a*b }
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>