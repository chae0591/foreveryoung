package com.forever.young.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Customer {
	private int user_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birth;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_regDate;
	private int address_no;
	
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
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public Date getUser_regDate() {
		return user_regDate;
	}
	public void setUser_regDate(Date user_regDate) {
		this.user_regDate = user_regDate;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	
	@Override
	public String toString() {
		return "Customer [user_num=" + user_num + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_gender=" + user_gender + ", user_birth="
				+ user_birth + ", user_regDate=" + user_regDate + ", address_no=" + address_no + "]";
	}
}
