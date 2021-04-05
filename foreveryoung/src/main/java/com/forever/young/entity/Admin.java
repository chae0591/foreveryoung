package com.forever.young.entity;

import java.sql.Date;

public class Admin {
	private int admin_no;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private Date admin_regDate;
	private String admin_phone;
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public Date getAdmin_regDate() {
		return admin_regDate;
	}
	public void setAdmin_regDate(Date admin_regDate) {
		this.admin_regDate = admin_regDate;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	@Override
	public String toString() {
		return "Admin [admin_no=" + admin_no + ", admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name="
				+ admin_name + ", admin_regDate=" + admin_regDate + ", admin_phone=" + admin_phone + "]";
	}


	
	

}
