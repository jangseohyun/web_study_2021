<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp
	
	// 이전 페이지로(MemberScoreInsertForm.jsp)부터 데이터 수신
	// → sid, kor, eng, mat
	String sid = request.getParameter("sid");
	String ukor = request.getParameter("kor");
	String ueng = request.getParameter("eng");
	String umat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성 
	MemberScoreDAO dao = new MemberScoreDAO();
	
	int kor = Integer.parseInt(ukor);
	int eng = Integer.parseInt(ueng);
	int mat = Integer.parseInt(umat);
	
	try
	{
		dao.connection();
		
		// MemberScoreDTO 구성(SID, KOR, ENG, MAT)
		MemberScoreDTO member = new MemberScoreDTO();
		member.setSid(sid);
		member.setKor(kor);
		member.setEng(eng);
		member.setMat(mat);
		
		// add() 메소드 호출 -> 데이터 입력(insert 수행)
		dao.add(member);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 새로운 페이지 요청할 수 있도록 처리 -> MemberScoreSelect.jsp
	response.sendRedirect("MemberScoreSelect.jsp");
	
%>