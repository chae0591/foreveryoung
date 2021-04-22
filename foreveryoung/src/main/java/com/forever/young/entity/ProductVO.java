package com.forever.young.entity;

import java.sql.Date;

public class ProductVO {
	private int product_no;
	private String product_category;
	private String product_name; 
	private int product_price;
	private int product_stock;
	private Date product_regDate;
	private int product_brand;
	private String product_skintype;
	private int rn;
	
	private int type_no;
	private int event_no;
	
	private int brand_num;
	private String brand_id;
	private String brand_name;
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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
	public int getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(int product_brand) {
		this.product_brand = product_brand;
	}
	public String getProduct_skintype() {
		return product_skintype;
	}
	public void setProduct_skintype(String product_skintype) {
		this.product_skintype = product_skintype;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	@Override
	public String toString() {
		return "ProductVO [product_no=" + product_no + ", product_category=" + product_category + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_regDate=" + product_regDate + ", product_brand=" + product_brand + ", product_skintype="
				+ product_skintype + ", rn=" + rn + ", type_no=" + type_no + ", event_no=" + event_no + ", brand_num="
				+ brand_num + ", brand_id=" + brand_id + ", brand_name=" + brand_name + "]";
	}

	
}
