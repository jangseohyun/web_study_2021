<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	
	session.removeAttribute("userId");
	session.removeAttribute("userPwd");
	//-- 세션의 사용자 아이디와 패스워드 삭제
	
	// 새롭게 요청할 페이지 안내
	response.sendRedirect("TestSession01.jsp");
%>