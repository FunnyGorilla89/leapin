package DTO;

public class Category_DTO {
	private int cno;
	private String cname;
	public Category_DTO(){}
	public Category_DTO(int cno, String cname) {
		super();
		this.cno = cno;
		this.cname = cname;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
}
