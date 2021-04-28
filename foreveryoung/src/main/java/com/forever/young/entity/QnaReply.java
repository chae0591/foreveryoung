package com.forever.young.entity;

import java.util.Date;

public class QnaReply {
	private int detail_reply_no;
	private int detail_qna_no;
	private int user_num;
	private String reply_context;
	private Date reply_date;
	public QnaReply() {
		super();
	}
	public int getDetail_reply_no() {
		return detail_reply_no;
	}
	public void setDetail_reply_no(int detail_reply_no) {
		this.detail_reply_no = detail_reply_no;
	}
	public int getDetail_qna_no() {
		return detail_qna_no;
	}
	public void setDetail_qna_no(int detail_qna_no) {
		this.detail_qna_no = detail_qna_no;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getReply_context() {
		return reply_context;
	}
	public void setReply_context(String reply_context) {
		this.reply_context = reply_context;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "QnaReply [detail_reply_no=" + detail_reply_no + ", detail_qna_no=" + detail_qna_no + ", user_num="
				+ user_num + ", reply_context=" + reply_context + ", reply_date=" + reply_date + "]";
	}
}
