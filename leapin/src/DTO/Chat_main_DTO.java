package DTO;

public class Chat_main_DTO {
	private int ono;
	private String e_name;
	private String content;
	private String date_time;
	private String file_name;
	
	public Chat_main_DTO() {
		
	}
	public Chat_main_DTO(int ono, String e_name, String content, String date_time, String file_name) {
		super();
		this.ono = ono;
		this.e_name = e_name;
		this.content = content;
		this.date_time = date_time;
		this.file_name = file_name;
	}
	public Chat_main_DTO(int ono, String e_name, String content, String date_time) {
		this.ono = ono;
		this.e_name = e_name;
		this.content = content;
		this.date_time = date_time;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	}
}
