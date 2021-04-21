package com.forever.young.entity;

import java.sql.Timestamp;

public class OrderMypgVO {
	private int order_no;
	private int order_customer;
	private int order_brand;
	private int order_product;
	private int order_amount;
	private String order_status;
	private int order_totalPrice;
	private Timestamp order_time;
	private String product_name;
	private int product_price;
	private String brand_name;
	
	private String image_save_name;
	private String image_type;
	private String image_name;
	
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
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
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
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	
	public String getImage_save_name() {
		return image_save_name;
	}
	public void setImage_save_name(String image_save_name) {
		this.image_save_name = image_save_name;
	}
	public String getImage_type() {
		return image_type;
	}
	public void setImage_type(String image_type) {
		this.image_type = image_type;
	}
	
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	
	@Override
	public String toString() {
		return "OrderMypgVO [order_no=" + order_no + ", order_customer=" + order_customer + ", order_brand="
				+ order_brand + ", order_product=" + order_product + ", order_amount=" + order_amount
				+ ", order_status=" + order_status + ", order_totalPrice=" + order_totalPrice + ", order_time="
				+ order_time + ", product_name=" + product_name + ", product_price=" + product_price + ", brand_name="
				+ brand_name + ", image_save_name=" + image_save_name + ", image_type=" + image_type + ", image_name="
				+ image_name + "]";
	}
	
	
}
