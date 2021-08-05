package DTO;

public class ReceivedOffer_DTO {
	private String date_time;
	private String e_name;
	private String c_name;
	private int cno;
	public ReceivedOffer_DTO() {}
	public ReceivedOffer_DTO(String date_time, String e_name, String c_name, int cno) {
		this.date_time = date_time;
		this.e_name = e_name;
		this.c_name = c_name;
		this.cno = cno;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
}
