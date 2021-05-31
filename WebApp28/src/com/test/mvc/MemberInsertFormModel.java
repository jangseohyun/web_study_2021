package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertFormModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ClassNotFoundException, SQLException
	{
		String result = "";
		
		result = "WEB-INF/view/MemberInsertForm.jsp";
		
		return result;
	}
}
