package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.svt.DBConn;


public class MemberDAO
{
	public Connection conn;
	
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		
		return conn;
	}
	
	// 데이터 추가
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERLIST(ID,PW,NAME,TEL,EMAIL) VALUES(?,?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 데이터 조회
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setId(rs.getString("ID"));
			dto.setPw(rs.getString("PW"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setEmail(rs.getString("EMAIL"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 중복 데이터 조회
	public int count(String tel) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST WHERE TEL=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tel);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("COUNT");
		
		return result;
	}
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
