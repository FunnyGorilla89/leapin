package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Deal_List_DTO;
import DTO.Request_DTO;

public class Deal_list_DAO {
	Connection conn;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userId = "leapin";
	String userPw = "leapin1234";
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	public Deal_list_DAO(){
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
	
	public void get_send_request_info(ArrayList<Deal_List_DTO> darray, String id) {
		sql = "select c.cname,r.content,r.state,e.name, o.content,o.price,o.date_time "
				+ "from request r, offer o,enterprise e,category c "
				+ "where c.cno = r.cno and o.rno = r.rno and e.id = o.name and r.request_id = ? "
				+ "and r.state = '거래완료'";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deal_List_DTO dd = new Deal_List_DTO();
				dd.setC_name(rs.getString(1));
				dd.setR_content(rs.getString(2));
				dd.setState(rs.getString(3));
				dd.setName(rs.getString(4));
				dd.setO_content(rs.getString(5));
				dd.setPrice(rs.getString(6));
				dd.setO_date_time(rs.getString(7));		
				darray.add(dd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void get_send_offer_info (ArrayList<Deal_List_DTO> darray, String id) {
		sql = "select o.content, o.price, o.date_time ,m.name,c.cname,r.content,r.date_time "
				+ "from request r, offer o,member m,category c "
				+ "where c.cno = r.cno and o.rno = r.rno and m.id = r.request_id and o.name = ? and o.state = '거래완료'";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deal_List_DTO dl = new Deal_List_DTO();
				dl.setO_content(rs.getString(1));
				dl.setPrice(rs.getString(2));
				dl.setO_date_time(rs.getString(3));
				dl.setName(rs.getString(4));
				dl.setC_name(rs.getString(5));
				dl.setR_content(rs.getString(6));
				dl.setR_date_time(rs.getString(7));
				
				darray.add(dl);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
