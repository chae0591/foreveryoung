package com.forever.young.entity;

import java.sql.Timestamp;

public class Order {
	private int order_no;
	private int order_customer;
	private int order_address;
	private int order_brand;
	private int order_product;
	private int order_amount;
	private int order_totalPrice;
	private Timestamp order_time;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_customer() {
		return order_customer;
	}
	public void setOrder_customer(int order_customer) {
		this.order_customer = order_customer;
	}
	public int getOrder_address() {
		return order_address;
	}
	public void setOrder_address(int order_address) {
		this.order_address = order_address;
	}
	public int getOrder_brand() {
		return order_brand;
	}
	public void setOrder_brand(int order_brand) {
		this.order_brand = order_brand;
	}
	public int getOrder_product() {
		return order_product;
	}
	public void setOrder_product(int order_product) {
		this.order_product = order_product;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public int getOrder_totalPrice() {
		return order_totalPrice;
	}
	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	public Timestamp getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}
	
	@Override
	public String toString() {
		return "Order [order_no=" + order_no + ", order_customer=" + order_customer + ", order_address=" + order_address
				+ ", order_brand=" + order_brand + ", order_product=" + order_product + ", order_amount=" + order_amount
				+ ", order_totalPrice=" + order_totalPrice + ", order_time=" + order_time + "]";
	}
}
