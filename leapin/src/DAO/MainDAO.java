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

public class MainDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public MainDAO(){
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
	
	public void getEnterprise(ArrayList<Enterprise_DTO> list_Enterprise) {
		String sql = "SELECT b2.* FROM ( SELECT rownum rnum, b.* FROM (SELECT * FROM enterprise ORDER BY starpoint desc) b) b2 WHERE rnum between 1 and 3";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String c_number = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String id = rs.getString(5);
				String ceo_name = rs.getString(6);
				String tel = rs.getString(7);
				String address = rs.getString(8);
				String service_area = rs.getString(9);
				int cno = rs.getInt(10);
				String company_content = rs.getString(11);
				String service_content = rs.getString(12);
				String file_name = rs.getString(13);
				int hitcount = rs.getInt(14);
				String date_time = rs.getString(15);
				int complete = rs.getInt(16);
				int starpoint = rs.getInt(17);
				
				Enterprise_DTO vo = new Enterprise_DTO(c_number, name, email, id, ceo_name, tel, address,service_area, cno, company_content, service_content, file_name, hitcount, date_time, complete, starpoint );
				list_Enterprise.add(vo); 
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
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
	
	public void getReview(ArrayList<Review_DTO> list_Review, String cn) {
		String sql = "SELECT * FROM review WHERE c_number=?";
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rdx = rs.getInt(1);
				String content = rs.getString(2);
				String writer = rs.getString(3);
				int starpoint = rs.getInt(4);
				String c_number = rs.getString(5);
				String date_time = rs.getString(6);
				String file_name = rs.getString(7);
				int warning = rs.getInt(8);
				Review_DTO vo = new Review_DTO(rdx, content, writer, starpoint, c_number, date_time, file_name, warning);
				list_Review.add(vo);
			}
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
	
	public String enterprise_Chk(String id) {
		String sql = "select e.id from member m, enterprise e where m.id = e.id and m.id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("기업회원입니다.");
				return rs.getString(1);
			}else{
				System.out.println("일반회원입니다.");
				return null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

