package com.forever.young.entity;

public class Address {
	private int address_no;
	private String address_name;
	private String address_zonecode;
	private String address_jibun;
	private String address_roadname;
	private String address_detail;
	private String address_phone;
	private int address_customer;
	private int address_brand;
	
	public int getAddress_customer() {
		return address_customer;
	}
	public void setAddress_customer(int address_customer) {
		this.address_customer = address_customer;
	}
	public int getAddress_brand() {
		return address_brand;
	}
	public void setAddress_brand(int address_brand) {
		this.address_brand = address_brand;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_zonecode() {
		return address_zonecode;
	}
	public void setAddress_zonecode(String address_zonecode) {
		this.address_zonecode = address_zonecode;
	}
	public String getAddress_jibun() {
		return address_jibun;
	}
	public void setAddress_jibun(String address_jibun) {
		this.address_jibun = address_jibun;
	}
	public String getAddress_roadname() {
		return address_roadname;
	}
	public void setAddress_roadname(String address_roadname) {
		this.address_roadname = address_roadname;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getAddress_phone() {
		return address_phone;
	}
	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}
	
	@Override
	public String toString() {
		return "Address [address_no=" + address_no + ", address_name=" + address_name + ", address_zonecode="
				+ address_zonecode + ", address_jibun=" + address_jibun + ", address_roadname=" + address_roadname
				+ ", address_detail=" + address_detail + ", address_phone=" + address_phone + ", address_customer="
				+ address_customer + ", address_brand=" + address_brand + "]";
	}
	
	
}
