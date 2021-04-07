package com.forever.young.entity;

import java.sql.Date;

public class CartListVO {
	private int cart_no;
	private int product_no;
	private String product_name;
	private String product_category;
	private int product_price;
	private String brand_name;
	private String product_skintype;
	private int cart_count;
	private Date cart_regDate;
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getProduct_skintype() {
		return product_skintype;
	}
	public void setProduct_skintype(String product_skintype) {
		this.product_skintype = product_skintype;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public Date getCart_regDate() {
		return cart_regDate;
	}
	public void setCart_regDate(Date cart_regDate) {
		this.cart_regDate = cart_regDate;
	}
	
	@Override
	public String toString() {
		return "CartListVO [cart_no=" + cart_no + ", product_no=" + product_no + ", product_name=" + product_name
				+ ", product_category=" + product_category + ", product_price=" + product_price + ", brand_name="
				+ brand_name + ", product_skintype=" + product_skintype + ", cart_count=" + cart_count
				+ ", cart_regDate=" + cart_regDate + "]";
	}
}
