package DTO;

import java.sql.*;
public class Review_DTO {
	private int rdx;
	private String content;
	private String writer;
	private int starpoint;
	private String c_number;
	private String date_time;
	private String file_name;
	private int warning;
	public Review_DTO() {}
	public Review_DTO(int rdx, String content, String writer, int starpoint, String c_number, String date_time,
			String file_name, int warning) {
		super();
		this.rdx = rdx;
		this.content = content;
		this.writer = writer;
		this.starpoint = starpoint;
		this.c_number = c_number;
		this.date_time = date_time;
		this.file_name = file_name;
		this.warning = warning;
	}
	public int getRdx() {
		return rdx;
	}
	public void setRdx(int rdx) {
		this.rdx = rdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}
	public String getC_number() {
		return c_number;
	}
	public void setC_number(String c_number) {
		this.c_number = c_number;
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
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	
}
