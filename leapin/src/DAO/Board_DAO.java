package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Board_DTO;
import DTO.Reply_DTO;

public class Board_DAO {
	
	Connection conn;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userId = "leapin";
	String userPw = "leapin1234";
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	public Board_DAO(){
		conn = null;
		try {
			Class.forName(driver);	
			conn = DriverManager.getConnection(url,userId,userPw);
		}catch (SQLException e) {
			e.printStackTrace();
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void create_board(int startRow,int endRow,String sel1,String sel2,String search_val ,ArrayList<Board_DTO> barry) {
		String sql = "select b2.* from (select rownum r,b.* from (select * from board order by "+sel1+" desc)b)b2 where (r BETWEEN ? AND ?) and "+sel2+" like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, search_val);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int bno = rs.getInt(2);
				 String title = rs.getString(3);
				 String writer = rs.getString(4);
				 String content = rs.getString(5);
				 int hitcount = rs.getInt(6);
				 int recommend = rs.getInt(7);
				 int warning = rs.getInt(8);
				 String date_time = rs.getString(9);
				 String file_name = rs.getString(10); 
				Board_DTO bd = new Board_DTO(bno, title, writer, content, hitcount, recommend, warning, date_time, file_name);
				barry.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	};
	
	public int getBoardCount(String sel2, String search_val){
		int count = 0;
		sql = "select count(*) from board where ";
		sql += sel2;
		sql += " like ?";
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, search_val);
			 rs = pstmt.executeQuery();
			System.out.println("!");
			if(rs.next()){
				count = rs.getInt(1);
				System.out.println(count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return count; // 총 게시물 수 리턴
	};
	public void select_board(int bno,Board_DTO bd) {
		sql = "select * from board where bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String title = rs.getString(2);
				 bd.setTitle(title);
				 String writer = rs.getString(3);
				 bd.setWriter(writer);
				 String content = rs.getString(4);
				 bd.setContent(content);
				 int hitcount = rs.getInt(5);
				 bd.setHitcount(hitcount);
				 int recommend = rs.getInt(6);
				 bd.setRecommend(recommend);
				 int warning = rs.getInt(7);
				 bd.setWarning(warning);
				 String date_time = rs.getString(8);
				 bd.setDate_time(date_time);
				 String file_name = rs.getString(9); 
				 bd.setFile_name(file_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void select_board_reply(int bno,ArrayList<Reply_DTO> rarray) {
		sql = "select * from reply where bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
			Reply_DTO rd = new Reply_DTO();
			rd.setWriter(rs.getString(2));
			rd.setDate_time(rs.getString(3));
			rd.setR_number(rs.getInt(4));
			rd.setWarning(rs.getInt(5));
			rd.setContent(rs.getString(6));
			rarray.add(rd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
