package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ClassNotFoundException, SQLException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		dao.connection();
		
		request.setAttribute("lists", dao.lists());
		
		result = "WEB-INF/view/MemberList.jsp";
		
		dao.close();
		
		return result;
	}
}
