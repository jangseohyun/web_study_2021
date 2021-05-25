<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Updated_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	String pageNum = request.getParameter("pageNum");
	
	dao.updateData(dto);
	
	response.sendRedirect("List.jsp?pageNum="+pageNum);
%>