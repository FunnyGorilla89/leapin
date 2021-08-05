package DTO;

public class Offer_DTO {
	private int ono;
	private int rno;
	private String name;
	private String content;
	private int cno;
	private String date_time;
	private String state;
	private String file_name;
	private String price;
	public Offer_DTO(){}
	public Offer_DTO(int ono, int rno, String name, String content, int cno, String date_time, String state,
			String file_name, String price) {
		super();
		this.ono = ono;
		this.rno = rno;
		this.name = name;
		this.content = content;
		this.cno = cno;
		this.date_time = date_time;
		this.state = state;
		this.file_name = file_name;
		this.price = price;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
}
