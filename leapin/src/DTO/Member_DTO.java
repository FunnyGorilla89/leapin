package DTO;

public class Member_DTO {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String phone;
	private String date_time;
	private int warning_cnt;
	public Member_DTO() {}
	public Member_DTO(String id, String pw, String name, String address, String phone, String date_time,
			int warning_cnt) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.date_time = date_time;
		this.warning_cnt = warning_cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public int getWarning_cnt() {
		return warning_cnt;
	}
	public void setWarning_cnt(int warning_cnt) {
		this.warning_cnt = warning_cnt;
	}
	
}
