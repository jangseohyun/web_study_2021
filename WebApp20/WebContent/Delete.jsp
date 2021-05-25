<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int num = Integer.parseInt(request.getParameter("num"));
	int result = dao.deleteData(num);
	
	String pageNum = request.getParameter("pageNum");
	
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
	
%>