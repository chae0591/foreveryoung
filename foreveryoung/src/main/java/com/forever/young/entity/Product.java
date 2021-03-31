package com.forever.young.entity;

import java.sql.Date;

public class Product {
	private int product_id;
	private String product_category;
	private String product_name; 
	private String product_img; 
	private int product_price;
	private int product_stock;
	private Date product_regDate;
	private int product_seller_num;
	private String product_user;
	private int type_no;
	private int event_no;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public Date getProduct_regDate() {
		return product_regDate;
	}
	public void setProduct_regDate(Date product_regDate) {
		this.product_regDate = product_regDate;
	}
	public int getProduct_seller_num() {
		return product_seller_num;
	}
	public void setProduct_seller_num(int product_seller_num) {
		this.product_seller_num = product_seller_num;
	}
	public String getProduct_user() {
		return product_user;
	}
	public void setProduct_user(String product_user) {
		this.product_user = product_user;
	}
	public int getType_no() {
		return type_no;
	}
	public void setType_no(int type_no) {
		this.type_no = type_no;
	}
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_category=" + product_category + ", product_name="
				+ product_name + ", product_img=" + product_img + ", product_price=" + product_price
				+ ", product_stock=" + product_stock + ", product_regDate=" + product_regDate + ", product_seller_num="
				+ product_seller_num + ", product_user=" + product_user + ", type_no=" + type_no + ", event_no="
				+ event_no + "]";
	}
	
	
	
}
