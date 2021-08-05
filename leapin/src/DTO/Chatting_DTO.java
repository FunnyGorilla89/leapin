package DTO;

public class Chatting_DTO {
	private int cno;
	private String output_id;
	private String input_id;
	private String content;
	private String date_time;
	private String file_name;
	private int ono;
	private int warning;
	public Chatting_DTO() {}
	public Chatting_DTO(int cno, String output_id, String input_id, String content, String date_time, String file_name,
			int ono, int warning) {
		super();
		this.cno = cno;
		this.output_id = output_id;
		this.input_id = input_id;
		this.content = content;
		this.date_time = date_time;
		this.file_name = file_name;
		this.ono = ono;
		this.warning = warning;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getOutput_id() {
		return output_id;
	}
	public void setOutput_id(String output_id) {
		this.output_id = output_id;
	}
	public String getInput_id() {
		return input_id;
	}
	public void setInput_id(String input_id) {
		this.input_id = input_id;
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
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	
}
