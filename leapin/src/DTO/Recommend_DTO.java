package DTO;

public class Recommend_DTO {
	private int rno;
	private String recommender;
	private String nominee;
	private String date_time;
	private int bno;
	public Recommend_DTO() {}
	public Recommend_DTO(int rno, String recommender, String nominee, String date_time, int bno) {
		super();
		this.rno = rno;
		this.recommender = recommender;
		this.nominee = nominee;
		this.date_time = date_time;
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	public String getNominee() {
		return nominee;
	}
	public void setNominee(String nominee) {
		this.nominee = nominee;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}
