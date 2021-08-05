package DTO;

public class Request_DTO {
	private int rno;
	private String request_id;
	private String offer_id;
	private String content;
	private int cno;
	private String date_time;
	private String state;
	private int hitcount;
	private String file_name;
	public Request_DTO() {}
	public Request_DTO(int rno, String request_id, String offer_id, String content, int cno, String date_time,
			String state, int hitcount, String file_name) {
		super();
		this.rno = rno;
		this.request_id = request_id;
		this.offer_id = offer_id;
		this.content = content;
		this.cno = cno;
		this.date_time = date_time;
		this.state = state;
		this.hitcount = hitcount;
		this.file_name = file_name;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getOffer_id() {
		return offer_id;
	}
	public void setOffer_id(String offer_id) {
		this.offer_id = offer_id;
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
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	
}
