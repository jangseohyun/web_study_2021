<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10</title>
<link rel="stylesheet" type="text/css" href ="css/main.css">
</head>
<body>

<!-- Send10.jsp → Send10_re.jsp  → Receive10.jsp -->
<!-- Send10.jsp → Send10_for.jsp → Receive10.jsp -->

<!--
	○ 사용자 최초 요청 페이지
		http://localhost:8090/WebApp07/Send10.jsp
 -->

<div>
   <h1>포워딩 및 리다이렉트</h1>
   <form action="" method="post">
   		이름
   		<input type="text" id="userName" name="userName">
   		<br><br>
   		<button type="submit" class="btn" style="width: 150px;" onclick="this.form.action='Send10_re.jsp'">리다이렉트</button>
   		<button type="submit" class="btn" style="width: 150px;" onclick="this.form.action='Send10_for.jsp'">포워드</button>
   </form>
</div>


</body>
</html>