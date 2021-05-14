<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		score.setName(userName);
		score.setKor(userKor);
		score.setEng(userEng);
		score.setMat(userMat);
		
		dao.add(score);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트가 요청해야 할 URL 주소 전달
	response.sendRedirect("ScoreList.jsp");

%>