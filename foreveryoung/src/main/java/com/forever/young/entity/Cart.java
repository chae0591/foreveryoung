package com.forever.young.entity;

import java.sql.Date;

public class Cart {
	private int cart_no;
	private int user_num;
	private int product_no;
	private int cart_count;
	private Date cart_regDate;
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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
		return "Cart [cart_no=" + cart_no + ", user_num=" + user_num + ", product_no=" + product_no + ", cart_count="
				+ cart_count + ", cart_regDate=" + cart_regDate + "]";
	}
}
