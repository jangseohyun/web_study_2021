/*===================
    Test005.java
    -Servlet 실습
===================*/


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Test005 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// get 방식의 요청에 대해 호출되어 실행되는 메소드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doGetPost(req, resp);
	}
	
	// post 방식의 요청에 대해 호출되어 실행되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doGetPost(req, resp);
	}

	// get 방식의 요청이든 post 방식의 요청이든
	// 모두 처리할 수 있는 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// 한글 깨짐방지 처리
		req.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 데이터 수신
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		resp.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디: " + userId + ", 패스워드: " + userPwd;
		
		try
		{
			PrintWriter out = resp.getWriter();

			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test005.java");
			out.print("</title>");
			out.print("</head>");
			out.print("<body>");
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습");
			out.print("</h1>");
			out.print("<hr>");
			out.print("</div>");
			out.print("<div>");
			out.print("<h2>");
			out.print("HttpServlet 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("<p>"+str+"</p>");
			out.print("<p>"+"method: "+req.getMethod()+"</p>");
			out.print("<p>");
			out.print("클라이언트 IP Address: "+req.getRemoteAddr());
			out.print("</p>");
			out.print("<p>"+"URI: "+req.getRequestURI()+"</p>");
			out.print("</div>");
			out.print("</body>");
			out.print("</html>");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
}
