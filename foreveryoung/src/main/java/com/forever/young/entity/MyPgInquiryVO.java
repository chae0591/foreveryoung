package com.forever.young.entity;

import java.sql.Date;

public class MyPgInquiryVO {
	private int inquiry_no;
	private String inquiry_title;
	private String inquiry_content;
	private Date inquiry_regDate;
	private int user_num;
	private String user_id;
	private int reply_no;
	public int getInquiry_no() {
		return inquiry_no;
	}
	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public Date getInquiry_regDate() {
		return inquiry_regDate;
	}
	public void setInquiry_regDate(Date inquiry_regDate) {
		this.inquiry_regDate = inquiry_regDate;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	
	@Override
	public String toString() {
		return "MyPgInquiryVO [inquiry_no=" + inquiry_no + ", inquiry_title=" + inquiry_title + ", inquiry_content="
				+ inquiry_content + ", inquiry_regDate=" + inquiry_regDate + ", user_num=" + user_num + ", user_id="
				+ user_id + ", reply_no=" + reply_no + "]";
	}
}
