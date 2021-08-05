package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Chat_main_DTO;
import DTO.Chatting_DTO;

public class Chat_DAO {

	Connection conn;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userId = "leapin";
	String userPw = "leapin1234";
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	public Chat_DAO(){
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
	
	public void chat_log(ArrayList<Chatting_DTO> carray,int ono,ArrayList<String> mname,ArrayList<String> uname) {
		sql = "select c.*,m1.name n1,m2.name n2 from chatting c,member m1, member m2 where (c.output_id = m1.id and c.input_id = m2.id) and ono = ? order by cno";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				int cno = rs.getInt(1);

				String output_id = rs.getString(2);

				String input_id = rs.getString(3);

				String content = rs.getString(4);

				String date_time = rs.getString(5);

				String file_name = rs.getString(6);

				int offer_number = rs.getInt(7);

				int warning = rs.getInt(8);
				uname.add(rs.getString(9));
				mname.add(rs.getString(10));
				carray.add(new Chatting_DTO(cno,output_id,input_id,content,date_time,file_name,offer_number,warning));

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}
	}
	public void get_Chat_info(String id, ArrayList<Chat_main_DTO> cmd) {
		sql = "select *\r\n" + 
				"from\r\n" + 
				"    (\r\n" + 
				"    select  o.ono,e.name,c.content,TO_CHAR(c.date_time,'YYYY-MM-DD HH24:MI:SS'),e.file_name,\r\n" + 
				"    row_number() over(PARTITION by o.ono order by c.cno desc) as row_idx\r\n" + 
				"    from offer o, request r, enterprise e, member m,chatting c\r\n" + 
				"    where o.rno = r.rno and o.name = e.id and m.id = r.request_id and c.ono = o.ono and m.id = ?\r\n" + 
				"    )\r\n" + 
				"    where row_idx = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt(1);
				String e_name = rs.getString(2);
				String content = rs.getString(3);
				String date_time = rs.getString(4);
				String file_name = rs.getString(5);
				
				cmd.add(new Chat_main_DTO(ono, e_name, content, date_time, file_name));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void get_Chat_info2(String id, ArrayList<Chat_main_DTO> cmd) {
		sql = "select *\r\n" + 
				"from\r\n" + 
				"    (\r\n" + 
				"    select  o.ono,m.name,c.content,TO_CHAR(c.date_time,'YYYY-MM-DD HH24:MI:SS'),\r\n" + 
				"    row_number() over(PARTITION by o.ono order by c.cno desc) as row_idx\r\n" + 
				"    from offer o, request r, member e, member m,chatting c\r\n" + 
				"    where o.rno = r.rno and o.name = e.id and m.id = r.request_id and c.ono = o.ono and e.id = ?\r\n" + 
				"    )\r\n" + 
				"    where row_idx = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt(1);
				String e_name = rs.getString(2);
				String content = rs.getString(3);
				String date_time = rs.getString(4);
				
				
				cmd.add(new Chat_main_DTO(ono, e_name, content, date_time));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean check_request(String id, int ono) {
		sql = "select count(*) from request r, offer o where o.rno = r.rno and r.request_id = ? and o.ono = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, ono);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)>0) {
					return  true;
				}else {
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public void insert_Message_content(String input_id, String output_id, int ono, String content,String file_name) {
		sql = "insert into chatting(cno,output_id,input_id,ono,content,file_name) VALUES (CHATTING_SEQ.NEXTVAL,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, output_id);
			pstmt.setString(2, input_id);
			pstmt.setInt(3, ono);
			pstmt.setString(4, content);
			pstmt.setString(5, file_name);
			int count = pstmt.executeUpdate();
			if(count == 1) {
				System.out.println("채팅등록성공");
			}else {
				System.out.println("채팅등록실패");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String get_e_name(int ono) {
		sql = "select e.name from enterprise e,offer o where e.id = o.name and o.ono = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "기업이름구하기 오류";
	}
}
