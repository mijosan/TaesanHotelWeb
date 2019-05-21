package com.spring.TaesanHotelWeb.biz.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {
	private int c_seq;
	private int b_seq;
	private String c_content;
	private String c_writer;
	private String c_regdate;
	
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		
		this.c_writer = c_writer;
	}
	public String getC_regdate() {
		
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		SimpleDateFormat test = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		this.c_regdate = test.format(c_regdate);
	}
	
}
