package com.forever.young.entity;

import java.util.Date;

public class Qna {
	private int detail_qna_no;
	private int product_no;
	private int user_num;
	private String write_title;
	private String write_context;
	private String qna_state;
	private Date write_date;
	public Qna() {
		super();
	}
	public int getDetail_qna_no() {
		return detail_qna_no;
	}
	public void setDetail_qna_no(int detail_qna_no) {
		this.detail_qna_no = detail_qna_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getWrite_title() {
		return write_title;
	}
	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}
	public String getWrite_context() {
		return write_context;
	}
	public void setWrite_context(String write_context) {
		this.write_context = write_context;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "Qna [detail_qna_no=" + detail_qna_no + ", product_no=" + product_no + ", user_num=" + user_num
				+ ", write_title=" + write_title + ", write_context=" + write_context + ", qna_state=" + qna_state
				+ ", write_date=" + write_date + "]";
	}

}
