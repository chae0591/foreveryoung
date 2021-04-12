package com.forever.young.entity;

import java.sql.Timestamp;
import java.util.Arrays;

public class OrderVO {
	private String address_name;
	private String address_zonecode;
	private String address_roadname;
	private String address_jibun;
	private String address_detail;
	private int[] order_brand;
	private int[] order_product;
	private int[] order_amount;
	private int[] order_totalPrice;
	
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
	public String getAddress_roadname() {
		return address_roadname;
	}
	public void setAddress_roadname(String address_roadname) {
		this.address_roadname = address_roadname;
	}
	public String getAddress_jibun() {
		return address_jibun;
	}
	public void setAddress_jibun(String address_jibun) {
		this.address_jibun = address_jibun;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public int[] getOrder_brand() {
		return order_brand;
	}
	public void setOrder_brand(int[] order_brand) {
		this.order_brand = order_brand;
	}
	public int[] getOrder_product() {
		return order_product;
	}
	public void setOrder_product(int[] order_product) {
		this.order_product = order_product;
	}
	public int[] getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int[] order_amount) {
		this.order_amount = order_amount;
	}
	public int[] getOrder_totalPrice() {
		return order_totalPrice;
	}
	public void setOrder_totalPrice(int[] order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	
	@Override
	public String toString() {
		return "OrderVO [address_name=" + address_name + ", address_zonecode=" + address_zonecode
				+ ", address_roadname=" + address_roadname + ", address_jibun=" + address_jibun + ", address_detail="
				+ address_detail + ", order_brand=" + Arrays.toString(order_brand) + ", order_product="
				+ Arrays.toString(order_product) + ", order_amount=" + Arrays.toString(order_amount)
				+ ", order_totalPrice=" + Arrays.toString(order_totalPrice) + "]";
	}
}
