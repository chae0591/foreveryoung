package com.forever.young.entity;

import java.sql.Date;

public class Brand {
	private int brand_num;
	private String brand_id;
	private String brand_pw;
	private String brand_name;
	private String brand_phone;
	private Date user_regDate;
	private String brand_permission;
	private int address_no;
	
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_pw() {
		return brand_pw;
	}
	public void setBrand_pw(String brand_pw) {
		this.brand_pw = brand_pw;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_phone() {
		return brand_phone;
	}
	public void setBrand_phone(String brand_phone) {
		this.brand_phone = brand_phone;
	}
	public Date getUser_regDate() {
		return user_regDate;
	}
	public void setBrand_regDate(Date brand_regDate) {
		this.user_regDate = brand_regDate;
	}
	public String getBrand_permission() {
		return brand_permission;
	}
	public void setBrand_permission(String brand_permission) {
		this.brand_permission = brand_permission;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	
	@Override
	public String toString() {
		return "Brand [brand_num=" + brand_num + ", brand_id=" + brand_id + ", brand_pw=" + brand_pw + ", brand_name="
				+ brand_name + ", brand_phone=" + brand_phone + ", brand_regDate=" + user_regDate
				+ ", brand_permission=" + brand_permission + ", address_no=" + address_no + "]";
	}
}
