package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Member_DAO {
	Connection conn;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userId = "leapin";
	String userPw = "leapin1234";
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Member_DAO() {
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
	public String log_in(String id) {
		sql = "select pw from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}else {
				return "0";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "1";
	}
	public int check_Enterprise(String id) {
		sql = "select count(*) from enterprise e where e.id = ?";
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
		}
		return count;
	}
}