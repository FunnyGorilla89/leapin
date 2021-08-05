package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Board_DTO;
import DTO.Category_DTO;
import DTO.Member_DTO;
import DTO.Offer_DTO;
import DTO.ReceivedOfferList_DTO;
import DTO.ReceivedOffer_DTO;
import DTO.Request_DTO;

public class LeapinDAO {
	private ResultSet rs;	// 필드는 기본적으로 객체를 생성하면 NULL값이 들어간다.
	private PreparedStatement pstmt;
	private Connection conn;
	private String sql;
	
	public LeapinDAO(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "leapin";
		String pw = "leapin1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pw);
		}
		catch(ClassNotFoundException e) {
			System.out.println("JDBC 로딩 실패");
		}
		catch(SQLException e) {
			System.out.println("오라클 접속 실패");
		}
	}
	
	
	public void get_category(ArrayList<Category_DTO> carray) {
		sql = "select * from category";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt(1);
				String c_name = rs.getString(2);
				carray.add(new Category_DTO(cno,c_name));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void get_receive_request_info(ArrayList<Request_DTO> rarray, String id) {
		sql = "select r.rno, r.request_id, r.offer_id, r.content, r.cno, r.date_time, r.state, r.hitcount, r.file_name, m.warning_cnt "
				+ "from request r, enterprise e, member m "
				+ "where r.offer_id=e.id and r.request_id = m.id and e.id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt(1);
				String rid = rs.getString(2);
				String oid = rs.getString(3);
				String content = rs.getString(4);
				int cno = rs.getInt(5);
				String date_time = rs.getString(6);
				String state = rs.getString(7);
				/*
				 * if(rs.getString(7).equals("0")) { state = "대기"; }else
				 * if(rs.getString(7).equals("1")) { state = "진행중"; }
				 */
				int hitcount = rs.getInt(8);
				String file_name = rs.getString(9);
				
				rarray.add(new Request_DTO(rno,rid,oid,content,cno,date_time,state,hitcount,file_name));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int get_warning_cnt(String id) {
		sql = "select warning_cnt from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("신고수 : " + rs.getInt(1));
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int get_cno_from_enterprise(String id) {
		sql = "select cno from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	

	
	public String get_member_request_name(String id) {
		sql = "select m.name from request r, member m where r.request_id = m.id and r.request_id= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString("m.name"));
				return rs.getString("m.name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String get_enterprise_request_name(String id) {
		sql = "select e.name from request r, member m where r.request_id = e.id and r.request_id= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString("e.name"));
				return rs.getString("e.name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	
	public boolean delete_receive_request_from_list(int rno) {
		sql="delete from request where rno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			int count = pstmt.executeUpdate();
			if(count>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	

	public String get_m_name(String id) {
		sql = "select m.name from member m, request r where m.id = r.request_id and r.request_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "끝^^";
	}
	public int Sign_up(String id, String pw, String name, String address, String phone) {
		sql = "insert into member(id,pw,name,address,phone) values(?,?,?,?,?)";
		try {
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			System.out.println(phone);
			
			count = pstmt.executeUpdate();
			
			if(count == 1) {
				System.out.println("회원가입이 완료되었습니다.");
				return 1;
			}
			else {
				System.out.println("정보를 다시 확인해주세요.");
				return 0;
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login_chk(String id, String pw) {	// 로그인 아이디, 패스워드 한번에
		int count = 0;
		sql = "select count(*) from member where id = ? and pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				count = rs.getInt(1);
				if(count == 1) {
					System.out.println("로그인 성공");
					return 0;
				}
				else {
					System.out.println("아이디와 비밀번호를 다시 입력해주세요");
					return 1;
				}
			}
			/*else {
				System.out.println("존재하지 않는 아이디입니다.");
				return -1;
			}*/
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
public String getpw(String id) {
		
		sql = "select pw from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			else {
				return null;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "오류";
	}
	
	public int id_chk(String id) {
		sql = "select count(*) from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					System.out.println("중복된 아이디입니다.");
					return 0;
				}
				else {
					System.out.println("사용 가능한 아이디입니다.");
					return 1;
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int member_info_edit(String pw, String name, String address, String phone, String id) {
		int count = 0;
		sql="update member set pw=?, name=?, address=?, phone=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, address);
			pstmt.setString(4, phone);
			pstmt.setString(5, id);
			count = pstmt.executeUpdate();
			if(count>0) {
				System.out.println("수정완료");
				return count;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("수정되지않았습니다.");
		return count;
	}
	
	public int member_change(String id) {
		sql = "delete from enterprise where id = ?";
		try {
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			count = pstmt.executeUpdate();
			if(count>0) {
				System.out.println("일반회원으로 전환되었습니다.");
				return 1;
			}else {
				System.out.println("전환되지 않았습니다.");
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String receive_name(String id) {
		String sql = "select name from member where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs.getString(1) + "님 안녕하세요");
				return rs.getString(1);
			}
			else {
				System.out.println("아이디를 다시 입력해주세요.");
				return "1";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_service_area_from_enterprise (String id) {	//기업 서비스지역 불러오기
		sql = "select service_area from enterprise where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("불러올 서비스지역이 없습니다.");
		return null;
	}
	
	public String receive_content_from_enterprise (String id) {		//기업소개 불러오기
		sql = "select content from enterprise where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("불러올 기업소개가 없습니다.");
		return null;
	}
	
	public String receive_service_content_from_enterprise (String id) {		//기업 서비스소개 불러오기
		sql = "select service_content from enterprise where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("불러올 기업소개가 없습니다.");
		return null;
	}
	
	public int enterprise_trans(String c_number, String name, String email, String id, String ceo_name, String tel, String address, String service_area, int cno, String content, String service_content, String file_name) {
		sql = "insert into enterprise (c_number,name,email,id,ceo_name,tel,address,service_area,cno,content,service_content,file_name) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_number);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.setString(5, ceo_name);
			pstmt.setString(6, tel);
			pstmt.setString(7, address);
			pstmt.setString(8, service_area);
			pstmt.setInt(9, cno);
			pstmt.setString(10, content);
			pstmt.setString(11, service_content);
			pstmt.setString(12, file_name);
			count = pstmt.executeUpdate();
			if(count>0) {
				System.out.println("기업회원으로 전환되었습니다.");
				return 1;
			}else {
				System.out.println("전환되지 않았습니다.");
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int enterprise_info_edit(String c_number, String id, String name, String ceo_name, String address, String tel, String email, String service_area, String content, String service_content, String file_name, int cno) {
		sql = "update enterprise set c_number = ?, name = ?, ceo_name = ?, address = ?, tel = ?, email = ?, "
				+ "service_area = ?, content = ?, service_content =? ,file_name =? , cno=? where id =?";
		try {
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_number);
			pstmt.setString(2, name);
			pstmt.setString(3, ceo_name);
			pstmt.setString(4, address);
			pstmt.setString(5, tel);
			pstmt.setString(6, email);
			pstmt.setString(7, service_area);
			pstmt.setString(8, content);
			pstmt.setString(9, service_content);
			pstmt.setString(10, file_name);
			pstmt.setInt(11, cno);
			pstmt.setString(12, id);
			count = pstmt.executeUpdate();
			if(count>0) {
				System.out.println("dao 기업회원 정보가 수정되었습니다.");
				return 1;
			}else {
				System.out.println("dao 기업회원 정보가 수정X");
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String receive_phone(String id) {

		sql = "select phone from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString(1);
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "0";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_c_number(String id) {
		sql = "select c_number from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString("c_number");
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "로그인이 필요합니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_enterprise_name(String id) {
		sql = "select name from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString(1);
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "로그인이 필요합니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_ceo_name(String id) {
		sql = "select ceo_name from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString(1);
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "로그인이 필요합니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_email(String id) {
		sql = "select email from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString(1);
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "로그인이 필요합니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public String receive_tel(String id) {
		sql = "select tel from enterprise where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString("tel");
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "로그인이 필요합니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "-1";
	}
	
	public int account_delete(String id) {
		sql = "delete from member where id=?";
		try {
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			count = pstmt.executeUpdate();
			if(count>0) {
				return 1;
			}else{
				return 0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int boardwrite(String id, String title, String content) {	// 게시글 작성
		
		sql = "insert into board(bno, title, content, writer) values(Board_SEQ.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			
			int count = pstmt.executeUpdate();
			System.out.println(count);
			return count;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int boardcount() {	// 게시글 총 개수
		int count = 0;
		
		String sql = "select count(*) from board";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getboardcount(String sname, String sd) {	// 작성자 검색 게시글 개수
		int count = 0;
		sql = "select count(*) from board where ";
		sql += sd;
		sql += " like ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
				System.out.println(count);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void getBoardByBno(int startrow, int endrow, ArrayList<Board_DTO> bd, String sname, String sd) {
		sql = "select * from(select rownum r, b2.* from(select b.* from board b where ";
		sql += sd;
		sql += " like ? order by bno desc)b2)where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String writer = rs.getString(5);
				int hitcount = rs.getInt(6);
				int recommend = rs.getInt(7);
				int warning = rs.getInt(8);
				String data_time = rs.getString(9);
				String file_name = rs.getString(10);
				bd.add(new Board_DTO(bno, title, content, writer, hitcount, recommend, warning, data_time, file_name));
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getBoardByHitcount(int startrow, int endrow, ArrayList<Board_DTO> bd) {
		// 게시판 조회수(select-box) 내림차순
		sql = "select * from(select rownum r, b2.* from(select b.* from board b order by hitcount desc)b2) where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String writer = rs.getString(5);
				int hitcount = rs.getInt(6);
				int recommend = rs.getInt(7);
				int warning = rs.getInt(8);
				String data_time = rs.getString(9);
				String file_name = rs.getString(10);
				bd.add(new Board_DTO(bno, title, content, writer, hitcount, recommend, warning, data_time, file_name));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String enterprise_Chk(String id) {
		sql = "select e.id from member m, enterprise e where m.id = e.id and m.id=?";
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
	
	public int get_cno_from_rno(int rno) {
		sql="select cno from request where rno =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean write_offer(int rno, String id, String content, String file_name, String price,int cno) {
		sql = "insert into offer(ono,rno,name,content,cno,file_name,price) values (offer_seq.nextval,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.setInt(4, cno);
			pstmt.setString(5, file_name);
			pstmt.setString(6, price);
			int count = pstmt.executeUpdate();
			if(count == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				return false;
	}
	
	public void update_request_state(int rno) {
		sql = "update request set state = '진행중' where rno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			int count = pstmt.executeUpdate();
			if(count>0) {
				System.out.println("요청서상태값 변경완료");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("요청서상태값 변경실패");
	}
	
	public String enterprise_category_name(String id) {
		sql="select c.cname from category c, enterprise e where c.cno = e.cno and e.id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString(1));
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String receive_category_name(int cno) {
		sql = "select name from category where cno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/* System.out.println(rs.getString(1) + "님 안녕하세요"); */
				return rs.getString("name");
			}
			else {
				/* System.out.println("아이디를 다시 입력해주세요."); */
				return "잘못된 카테고리번호입니다.";
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int writeoffer(String name, String content) {	// 견적서 작성 수정해야함.
		String sql = "insert into offer(ono, name, content) values(ONO_SEQ.nextval,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, content);
			
			int count = pstmt.executeUpdate();
			//System.out.println(count);
			return count;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void writerequest(String id, String offer_id, String content, int cno, String file_name) {
		sql = "insert into request(rno, request_id, offer_id, content, cno, date_time, file_name) values(REQUEST_SEQ.nextval, ?, ?, ?, ?, sysdate, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, offer_id);
			pstmt.setString(3, content);
			pstmt.setInt(4, cno);
			pstmt.setString(5, file_name);
			int count = pstmt.executeUpdate();
			System.out.println(count);
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getEnter_Id(int cno, ArrayList<String> enter_id) {	// 카테고리에 해당하는 기업 아이디 구하기
		String sql = "select e.id from enterprise e, category c where e.cno = c.cno and c.cno = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				enter_id.add(rs.getString(1));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getReceivedOfferByOno(int startrow, int endrow, ArrayList<Offer_DTO> od, String sname, String sd) {
		// ono 내림차순
		
		String sql = "select * from(select rownum r, o.* from(select o2.* from offer o2 where ";
		sql += sd;
		sql += " like ? order by ono desc)o)where r between ? and ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt(2);
				int rno = rs.getInt(3);
				String name = rs.getString(4);
				String content = rs.getString(5);
				int cno = rs.getInt(6);
				String date_time = rs.getString(7);
				String state = rs.getString(8);
				String file_name = rs.getString(9);
				String price = rs.getString(10);
				od.add(new Offer_DTO(ono, rno, name, content, cno, date_time, state, file_name, price));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getOfferByDate(int startrow, int endrow, ArrayList<Offer_DTO> od) {
		// 작성일자 내림차순
		sql = "select * from(select rownum r, o.* from(select o2.* from offer o2 order by date_time desc)o)where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt(2);
				int rno = rs.getInt(3);
				String name = rs.getString(4);
				String content = rs.getString(5);
				int cno = rs.getInt(6);
				String date_time = rs.getString(7);
				String state = rs.getString(8);
				String file_name = rs.getString(9);
				String price = rs.getString(10);
				od.add(new Offer_DTO(ono, rno, name, content, cno, date_time, state, file_name, price));
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getOfferByPrice(int startrow, int endrow, ArrayList<Offer_DTO> od) {
			// 가격별 내림차순
			sql = "select * from(select rownum r, o.* from(select o2.* from offer o2 order by price desc)o)where r between ? and ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int ono = rs.getInt(2);
					int rno = rs.getInt(3);
					String name = rs.getString(4);
					String content = rs.getString(5);
					int cno = rs.getInt(6);
					String date_time = rs.getString(7);
					String state = rs.getString(8);
					String file_name = rs.getString(9);
					String price = rs.getString(10);
					od.add(new Offer_DTO(ono, rno, name, content, cno, date_time, state, file_name, price));
				}
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
	}
	
	public int getoffercount(String sname, String sd) {	// 견적 작성자 검색(받은견적 개수)
		int count = 0;
		sql = "select count(*) from offer where ";
		sql += sd;
		sql += " like ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
				//System.out.println(count);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	 
	 public String SentRequest(String content) {
		 // 내가 보낸 요청서 작성 버튼 클릭 시 popover에 나올 요청서 내용
		 
		 sql = "select r.content from request r, offer o where r.rno = o.rno";
		 try {
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 content = rs.getString(1);
				 return content;
			 }
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
		 return "오류";
	 }
	 
	 public String SentOffer(String content) {
		 
		 sql = "select o.content from request r, offer o where o.ono = r.rno";
		 
		 try {
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 content = rs.getString(1);
				 return content;
			 }
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
		 return "오류";
	 }
	 
	
	 	
	 public void Receivedoffer(ArrayList<ReceivedOffer_DTO> rod, String id) {
		 // 받은 견적 카테고리별 ---> 받은 견적 페이지 append 추가 메서드
		 sql = "select *\r\n" + 
		 		"from\r\n" + 
		 		"    (\r\n" + 
		 		"    select r.date_time, e.name en, c.cname cn, c.cno,\r\n" + 
		 		"    row_number() over(PARTITION by c.cno order by o.ono desc) as row_idx\r\n" + 
		 		"    from  request r, enterprise e, category c, offer o\r\n" + 
		 		"    where r.rno = o.rno and o.cno = c.cno and c.cno = e.cno and r.request_id = ?\r\n" + 
		 		"    )\r\n" + 
		 		"    where row_idx = 1";
		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 //ReceivedOffer_DTO rod1 = new ReceivedOffer_DTO();
				 String date_time = rs.getString(1);
				 String e_name = rs.getString(2);
				 String c_name = rs.getString(3);
				 int cno = rs.getInt(4);
				 rod.add(new ReceivedOffer_DTO(date_time, e_name, c_name, cno));
			 }
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
	 }
//	 public int getCno(String id) {
//		 sql = "select c.cno from category c, offer o, request r, enterprise e where c.cno = o.cno and o.rno = r.rno and e.id = o.name and\r\n" + 
//		 		"r.request_id = ?";
//		 PreparedStatement pstmt1 = null;
//		 ResultSet rs1 = null;
//		 try {
//			 pstmt1 = conn.prepareStatement(sql);
//			 pstmt1.setString(1, id);
//			 
//			 rs1 = pstmt1.executeQuery();
//			 while(rs1.next()) {
//				 int cno = rs1.getInt(1);
//				 return cno;
//			 }
//		 }
//		 catch(SQLException e) {
//			 e.printStackTrace();
//		 }finally {
//			 try {
//				pstmt1.close();
//				rs1.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		 }
//		 return -1;
//	 }
	 public ArrayList<String> ReceiveOfferList(ArrayList<ReceivedOfferList_DTO> rod, String id, int cno) {
		 // 받은 견적 리스트를 위한 메서드
		 sql = "select o.*, e.name en, c.cname cn, m.warning_cnt,r.content,r.file_name \r\n" + 
		 		"from request r, enterprise e, category c, offer o, member m \r\n" + 
		 		"where r.rno = o.rno and o.cno = c.cno and c.cno = e.cno and e.id = o.name and m.id = e.id and r.request_id = ? and c.cno = ? order by ono";
		 String r_content = "처음값";
		 String r_file_name = "처음값";
		 ArrayList<String> r = new ArrayList<>();
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2,cno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int ono = rs.getInt(1);
				 int rno = rs.getInt(2);
				 String name = rs.getString(3);
				 String content = rs.getString(4);
				 
				 String date_time = rs.getString(6);
				 String state = rs.getString(7);
				 //System.out.println(state);
				 String file_name = rs.getString(8);
				 String price = rs.getString(9);
				 String e_name = rs.getString(10);
				 String c_name = rs.getString(11);
				 int warning_cnt = rs.getInt(12);
				 r_content = rs.getString(13);
				 r_file_name = rs.getString(14);
				 rod.add(new ReceivedOfferList_DTO(ono, rno, name, content, cno, date_time, state, file_name, price, e_name, c_name, warning_cnt));
			}
			
			r.add(r_content);
			
			r.add(r_file_name);			
			
			return r;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		 return r;
	 }

	 public void get_send_offer_info_to_receive_request(ArrayList<Offer_DTO> oarray, String id) {
			sql = "select o.ono, o.rno, o.name, o.content, o.cno, o.date_time, o.state, o.file_name, o.price \r\n" + 
					"from offer o, enterprise e ,request r \r\n" + 
					"where r.rno = o.rno and o.name=e.id and r.offer_id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Offer_DTO od = new Offer_DTO();
					od.setContent(rs.getString(4));
					od.setFile_name(rs.getString(8));
					od.setDate_time(rs.getString(6));
					od.setPrice(rs.getString(9));
//					int ono = rs.getInt(1);
//					int rno2 = rs.getInt(2);
//					String oname = rs.getString(3);
//					String content = rs.getString(4);
//					int cno = rs.getInt(5);
//					String date_time = rs.getString(6);
//					String state = rs.getString(7);
//					String file_name = rs.getString(8);
//					String price = rs.getString(9);
					oarray.add(od);
					//oarray.add(new Offer_DTO(ono,rno2,oname,content,cno,date_time,state,file_name,price));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
	
	
	 
	
	
	 public int getEnterCount(String id, int cno) {
		 // 견적서를 보낸 기업들의 count를 구하는 메서드(외 n명)
		 sql = "select count(*) from offer o, request r, member m, category c \r\n" + 
		 		"where o.rno = r.rno and o.cno = c.cno and m.id = r.request_id\r\n" + 
		 		"and r.request_id = ? and c.cno = ?";
		 int count = 0;
		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setInt(2, cno);
			 
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				count = rs.getInt(1);
				System.out.println("sql_count : " + count);
			 }
			 return count;
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
		 return count;
	 }
}