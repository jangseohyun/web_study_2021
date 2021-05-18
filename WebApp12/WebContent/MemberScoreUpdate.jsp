<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp

	// 이전 페이지(MemberScoreUpdateForm.jsp)로부터 데이터 수신
	// → sid, kor, eng, mat
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// MemberScoreDTO 구성
		MemberScoreDTO member = new MemberScoreDTO();
		
		member.setSid(sid);
		member.setKor(Integer.parseInt(kor));
		member.setEng(Integer.parseInt(eng));
		member.setMat(Integer.parseInt(mat));
		
		// update 쿼리문 수행 → MemberScoreDAO의 메소드 호출 → MemberScoreDTO 매개변수로 전달
		dao.modify(member);
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
	
	// 새로운 페이지(MemberScoreSelect.jsp) 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>