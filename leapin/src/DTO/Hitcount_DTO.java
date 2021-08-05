package DTO;

public class Hitcount_DTO {
	private int hno;
	private String visitor;
	private String writer;
	private String date_time;
	public Hitcount_DTO() {}
	public Hitcount_DTO(int hno, String visitor, String writer, String date_time) {
		super();
		this.hno = hno;
		this.visitor = visitor;
		this.writer = writer;
		this.date_time = date_time;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getVisitor() {
		return visitor;
	}
	public void setVisitor(String visitor) {
		this.visitor = visitor;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	
}
