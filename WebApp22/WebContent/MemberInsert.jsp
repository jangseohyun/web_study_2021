<%@page import="com.test.core.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	String[] names = request.getParameterValues("name");
	String[] tels = request.getParameterValues("tel");
	String[] addrs = request.getParameterValues("addr");
	
	for (int i=0; i<names.length; i++)
	{
		MemberDTO dto = new MemberDTO(names[i],tels[i],addrs[i]);
		lists.add(dto);
		/*
		MemberDTO ob = new MemberDTO(request.getParameter("name"+i)
									,request.getParameter("tel"+i)
									,request.getParameter("addr"+i));
		lists.add(ob);
		*/
	}
	
	request.setAttribute("lists",lists);
	
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>