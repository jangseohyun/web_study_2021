<%@ page contentType="text/html; charset=UTF-8"%>
<%
   // 스크립트 릿 영역
   
   // 한글 안깨지게 하는 영역
   request.setCharacterEncoding("UTF-8");

   /* // 가로 데이터 수신 숫자로
   int garo = Integer.parseInt(request.getParameter("su1"));
   
   // 세로 데이터 수신
   int searo = Integer.parseInt(request.getParameter("su2"));
   
   String result = "";
   
   int n=0;
   
   for(int i=0; i<searo; i++)
   {
      result += "<tr>";

      for(int j=1; j<=garo; j++)
      {
         result += "<td>" +  ++n + "</td>";
      }
      result += "</tr>";
   } */
   
   
   // 데이터 수신(스크립트 릿)
   String s1 = request.getParameter("su1");
   String s2 = request.getParameter("su2");
   
   int n1 = 0;
   int n2 = 0;
   
   // 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
   int n= 0;
   
   try
   {
      // 수신된 데이터 형 변환
      n1 = Integer.parseInt(s1);
      n2 = Integer.parseInt(s2);
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1>JSP 데이터 송수신 실습</h1>
   <hr>
   <p>Table.jsp → Table_ok.jsp ● </p>
</div>

<div>
   <table border="1">
   <% 
      for(int i=0; i<n2; i++)
      {
   %>
      <tr>
      <% 
         for(int j=0; j<n1; j++)
         {
      %>
            <td style="width: 30px;"><%=++n %></td>
      <% 
         }
      %>
      </tr>
   <%
      } 
   %>
   </table>
</div>

</body>
</html>