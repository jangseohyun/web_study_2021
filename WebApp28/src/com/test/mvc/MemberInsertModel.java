package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, UnsupportedEncodingException
	{
		String result = "";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		dao.connection();
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		
		dao.add(dto);
		
		result = "WEB-INF/view/MemberList.jsp";
		
		dao.close();
		
		return result;
	}
}
