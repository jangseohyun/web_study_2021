<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp_1
	
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConn.getConnection();

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	int result = 0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT) VALUES(SCORESEQ.NEXTVAL,'%s',%d,%d,%d)",name,kor,eng,mat);
	
	Statement stmt = conn.createStatement();
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if (result < 1)
	{
		response.sendRedirect("Error02.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}
	
%>