package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Category_DTO;
import DTO.Enterprise_DTO;
import DTO.Review_DTO;

public class Enterprise_FindDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public Enterprise_FindDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "leapin";
		String userPw = "leapin1234";
		
		try{	
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userId, userPw);
		}catch(ClassNotFoundException e) { e.printStackTrace(); }
		catch(SQLException e) { e. printStackTrace(); }
		
	}
	public void getEnterpriseFind(ArrayList<Enterprise_DTO> list_Enterprise) {
		String sql = "SELECT * FROM enterprise ORDER BY starpoint desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String c_number = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String id = rs.getString(4);
				String ceo_name = rs.getString(5);
				String tel = rs.getString(6);
				String address = rs.getString(7);
				String service_area = rs.getString(8);
				int cno = rs.getInt(9);
				String company_content = rs.getString(10);
				String service_content = rs.getString(11);
				String file_name = rs.getString(12);
				int hitcount = rs.getInt(13);
				String date_time = rs.getString(14);
				int complete = rs.getInt(15);
				int starpoint = rs.getInt(16);
				
				Enterprise_DTO vo = new Enterprise_DTO(c_number, name, email, id, ceo_name, tel, address,service_area, cno, company_content, service_content, file_name, hitcount, date_time, complete, starpoint );
				list_Enterprise.add(vo); 
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public Enterprise_DTO getEnterprise(String cn) {
		String sql = "SELECT * FROM enterprise WHERE c_number = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String c_number = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String id = rs.getString(4);
				String ceo_name = rs.getString(5);
				String tel = rs.getString(6);
				String address = rs.getString(7);
				String service_area = rs.getString(8);
				int cno = rs.getInt(9);
				String content = rs.getString(10);
				String service_content = rs.getString(11);
				String file_name = rs.getString(12);
				int hitcount = rs.getInt(13);
				String date_time = rs.getString(14);
				int complete = rs.getInt(15);
				int starpoint = rs.getInt(16);
				
				Enterprise_DTO vo = new Enterprise_DTO(c_number, name, email, id, ceo_name, tel, address,service_area, cno, content, service_content, file_name, hitcount, date_time, complete, starpoint );
				return vo; 
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getEnterpriseCount() {
		String sql = "SELECT count(*) FROM enterprise"; 
		try {	
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void getCategory(ArrayList<Category_DTO> list_Category) {
		String sql = "SELECT * FROM category";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt(1);
				String name = rs.getString(2);
				
				Category_DTO vo = new Category_DTO(cno,name);
				list_Category.add(vo);
			}
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getReview(ArrayList<Review_DTO> list_Review , String cn) {
		String sql = "SELECT * FROM review WHERE c_number = ? ORDER BY date_time DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rdx = rs.getInt(1);
				String content = rs.getString(2);
				String writer =  rs.getString(3);
				int starpoint = rs.getInt(4);
				String c_number = rs.getString(5);
				String date_time = rs.getString(6);
				String file_name = rs.getString(7);
				int warning = rs.getInt(8);
				
				Review_DTO vo = new Review_DTO(rdx, content, writer, starpoint, c_number, date_time, file_name, warning);
				list_Review.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int getReview3(ArrayList<Review_DTO> list_Review , String cn, int sn, int en) {
		String sql = "SELECT b2.* FROM (SELECT rownum rnum, b.* FROM (SELECT * FROM review WHERE c_number = ? ORDER BY date_time DESC) b) b2 WHERE rnum between ? and ?";
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			pstmt.setInt(2, sn);
			pstmt.setInt(3, en);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rdx = rs.getInt(2);
				String content = rs.getString(3);
				String writer =  rs.getString(4);
				int starpoint = rs.getInt(5);
				String c_number = rs.getString(6);
				String date_time = rs.getString(7);
				String file_name = rs.getString(8);
				int warning = rs.getInt(9);
				count++;
				Review_DTO vo = new Review_DTO(rdx, content, writer, starpoint, c_number, date_time, file_name, warning);
				list_Review.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public double getReviewAverage(String cn) {
		String sql = "SELECT round(AVG(starpoint),1) from review WHERE c_number = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1); 
			}
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void updateEnterprise_Starpoint(String cn) {
		String sql2 = "UPDATE enterprise SET starpoint = ? WHERE c_number = ?";
		double av = getReviewAverage(cn);
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setDouble(1, av);
			pstmt.setString(2, cn);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getReviewCount(String cn) {
		String sql = "SELECT count(*) FROM review WHERE c_number=?";
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public void scroll() {
		String sql = "select e2.* from(select e.*,rownum rnum from(select * from enterprise)e)e2 where rnum>=? and rnum<=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 2);
			pstmt.setInt(2, 2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
