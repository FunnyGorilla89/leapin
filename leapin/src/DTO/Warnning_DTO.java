package DTO;

public class Warnning_DTO {
	private int wno;
	private String title;
	private String content;
	private String reporter;
	private String attacker;
	private String date_time;
	public Warnning_DTO() {}
	public Warnning_DTO(int wno, String title, String content, String reporter, String attacker, String date_time) {
		super();
		this.wno = wno;
		this.title = title;
		this.content = content;
		this.reporter = reporter;
		this.attacker = attacker;
		this.date_time = date_time;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getAttacker() {
		return attacker;
	}
	public void setAttacker(String attacker) {
		this.attacker = attacker;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	
	
}
