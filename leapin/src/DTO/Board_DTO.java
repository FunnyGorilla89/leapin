package DTO;

public class Board_DTO {
	private int bno;
	private String title;
	private String writer;
	private String content;
	private int hitcount;
	private int recommend;
	private int warning;
	private String date_time;
	private String file_name;
	public Board_DTO(){}
	public Board_DTO(int bno, String title, String writer, String content, int hitcount, int recommend, int warning,
			String date_time, String file_name) {
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.hitcount = hitcount;
		this.recommend = recommend;
		this.warning = warning;
		this.date_time = date_time;
		this.file_name = file_name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	};
}
