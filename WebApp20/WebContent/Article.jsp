<%@page import="com.test.BoardDTO"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	/* String pageNum = request.getParameter("pageNum");
	// 목록으로 되돌아 갈 때 1페이지로 돌아가지 않기 위해 pageNum 쥐고 있는 것
	String num = request.getParameter("num"); 
	// 어떤 게시글 불러올지 알려줘야해서
	*/
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지 (List.jsp, 목록 페이지)로부터 수신(pageNum, num)
	String pageNum = request.getParameter("pageNum");			//-- 페이지 번호
	int num = Integer.parseInt(request.getParameter("num"));	//-- 게시물 번호
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져 오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);

	if(dto==null)	// 게시물을 삭제했다면
		response.sendRedirect("List.jsp");
	
	// 게시물 본문의 라인 수 확인 및 게시물 내용 재구성
	int lineSu = dto.getContent().split("\n").length; // (배열의 개수)
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<%-- 테스트

<h1>pageNum : <%= pageNum %></h1>
<h1>num : <%= num %></h1> --%>



<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<div id="bbsArticle">
		<div id ="bbsArticle_header">
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<!-- <dd>박정준</dd> -->
            	<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<!-- <dd>2</dd> -->
				<dd><%=lineSu%></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
         <dl>
            <dt>등록일</dt>
            <dd><%=dto.getCreated() %></dd>
            <dt>조회수</dt>
            <dd><%=dto.getHitCount() %></dd>
         </dl>
      </div><!-- bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
						<%=dto.getContent()%>
					</td>
				</tr>
			</table>
		</div><!-- bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<!-- 이전글 -->
				<%
				if (beforeNum != -1)
				{
				%>
				<a href="">이전글: (<%=beforeNum%>) <%=dtoBefore.getSubject()%></a>
				<%
				}
				else
				{
				%>
				이전글: 없음
				<%
				}
				%>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<!-- 이전글 -->
				<%
				if (nextNum != -1)
				{
				%>
				<a href="">다음글: (<%=nextNum%>) <%=dtoNext.getSubject()%></a>
				<%
				}
				else
				{
				%>
				이전글: 없음
				<%
				}
				%>
		</div><!-- .bbtArticle_noLine -->
		
		<div class="bbsArticle_noLine" style="text-align:right;">
			From : <%=dto.getIpAddr()%>
		</div><!-- .bbtArticle_noLine -->
		
		<div id="bbsArticle_footer">
			<div id="leftFooter">
				<input type = "button" value="수정" class="btn2"
				onclick="javascript:location.href='<%=cp %>/Updated.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'">
				<input type = "button" value="삭제" class="btn2"
				onclick="javascript:location.href='<%=cp %>/Delete.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'">
			</div><!-- #left_footer -->
			
			<!-- 검색 기능 적용 시 변경 예정 -->
			<div id="rightFooter">
	        	 <input type="button" value="리스트" class="btn2"
	        	 onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
	      </div><!-- #rightFooter -->
	</div><!-- -#bbsArticle -->
</div><!-- #bbs -->





</body>
</html>