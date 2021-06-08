<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
   .txtNum
   {
      width: 100px;
      text-align: right;
   }
</style> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

   $(function()
   {
      // 선택자 → sendButton
      $("#sendButton").click(function()
      {
         var su1 = $("#su1").val();
         var su2 = $("#su2").val();
         var oper = $("#oper").val();
         
         // ○ 『$.get(url, data, callBack)』
         //     - 매개변수로 전달받은 URL을 사용하여
         //       서버에 대한 GET 요청을 전송한다.
         // "GetTest01_ok.jsp"
         //, {su1:su1, su2:}su1, oper:oper  수신된 데이터가 있다면~
         $.get("PostTest01_ok.jsp"
         , {su1:su1, su2:su2, oper:oper }
         , function(args)
         {
            // args에 집어넣겠다.
            $("#result").html(args);
         });
         // url → 경로 포함 요청 페이지
         // data → { 이름:값, 이름:값, 이름:값, ... }
         // callBack → 기능 → 함수
         
         // $.get("GetTest01_ok.jsp", {su1:su1, su2:su2, oper:oper }, function(args){$("#result").html});
         // $.get("요청URL", {이름:값}, function(넘겨받은값){$(선택자).html(값);});
         
      });
   });

</script>

</head>
<body>

<div>
   <h1>jQuery 의 get() 메소드 실습</h1>
   <hr>
</div>

<div>
   <input type="text" id="su1" class="txt txtNum">
   <select id="oper">
      <option value="add">덧셈</option>
      <option value="sub">뺄셈</option>
      <option value="mul">곱셈</option>
      <option value="div">나눗셈</option>
   </select>
   <input type="text" id="su2" class="txt txtNum">
   <input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>

<div id="result">
</div>

<br>
<br>

</body>
</html>