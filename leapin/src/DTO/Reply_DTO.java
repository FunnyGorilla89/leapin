package DTO;

public class Reply_DTO {
	private int bno;
	private String writer;
	private String date_time;
	private int r_number;
	private int warning;
	private String content;
	public Reply_DTO() {}
	public Reply_DTO(int bno, String writer, String date_time, int r_number, int warning, String content) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.date_time = date_time;
		this.r_number = r_number;
		this.warning = warning;
		this.content = content;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
