/*============================================
   ScoreDAO.java
   - 데이터베이스 액션 처리 전용 객체 활용
============================================*/
// WebApp11

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
   // 주요 속성 구성
   private Connection conn;
   
   // 데이터베이스 연결 → 생성자 형태로 정의
   public ScoreDAO() throws ClassNotFoundException, SQLException
   {
      conn = DBConn.getConnection();
   }
   
   // 데이터 입력 메소드
   public int add(ScoreDTO dto) throws SQLException
   {
      int result = 0;
      
      // 작업 객체 생성
      Statement stmt = conn.createStatement();
      
      // 쿼리문 준비
      String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(MEMBERSEQ.NEXTVAL, '%s', %s, %s, %s)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
      
      result = stmt.executeUpdate(sql);
      
      // 리소스 반납
      stmt.close();
      
      return result;
   }
   
   // 리스트 전체 출력 메소드
   public ArrayList<ScoreDTO> lists() throws SQLException
   {
      ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
      
      // 작업 객체 생성
      Statement stmt = conn.createStatement();
      
      // 쿼리문 준비
      String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ((KOR+ENG+MAT)/3) AS AVG FROM TBL_SCORE ORDER BY SID");
      
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next())
      {
    	 ScoreDTO dto = new ScoreDTO();
         dto.setSid(rs.getString("SID"));
         dto.setName(rs.getString("NAME"));
         dto.setKor(rs.getString("KOR"));
         dto.setEng(rs.getString("ENG"));
         dto.setMat(rs.getString("MAT"));
         dto.setTot(rs.getString("TOT"));
         dto.setAvg(rs.getString("AVG"));
          
         result.add(dto);
      }
      
      // 리소스 반납
      rs.close();
      stmt.close();
      
      return result;
   }
   
   // 인원 수 확인을 위한 메소드
   public int count() throws SQLException
   {
      int result = 0;
      
      // 작업 객체 생성
      Statement stmt = conn.createStatement();
      
      // 쿼리문 준비
      String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
      
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next())
      {
         result = rs.getInt("COUNT");
      }
      
      // 리소스 반납
      rs.close();
      stmt.close();
      
      return result;
   }
   
   // 데이터베이스 연결 종료 담당 메소드
   public void close() throws SQLException
   {
      DBConn.close();
   }
}