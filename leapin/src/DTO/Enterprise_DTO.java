package DTO;

public class Enterprise_DTO {
	private String c_number;
	private String name;
	private String email;
	private String id;
	private String ceo_name;
	private String tel;
	private String address;
	private String service_area;
	private int cno;
	private String content;
	private String service_content;
	private String file_name;
	private int hitcount;
	private String date_time;
	private int complete;
	private int starpoint;
	public Enterprise_DTO() {}
	public Enterprise_DTO(String c_number, String name, String email, String id, String ceo_name, String tel,
			String address, String service_area, int cno, String content, String service_content, String file_name,
			int hitcount, String date_time, int complete, int starpoint) {
		super();
		this.c_number = c_number;
		this.name = name;
		this.email = email;
		this.id = id;
		this.ceo_name = ceo_name;
		this.tel = tel;
		this.address = address;
		this.service_area = service_area;
		this.cno = cno;
		this.content = content;
		this.service_content = service_content;
		this.file_name = file_name;
		this.hitcount = hitcount;
		this.date_time = date_time;
		this.complete = complete;
		this.starpoint = starpoint;
	}
	public String getC_number() {
		return c_number;
	}
	public void setC_number(String c_number) {
		this.c_number = c_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getService_area() {
		return service_area;
	}
	public void setService_area(String service_area) {
		this.service_area = service_area;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getService_content() {
		return service_content;
	}
	public void setService_content(String service_content) {
		this.service_content = service_content;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}
	
}
