package com.forever.young.entity;

public class MyPgVoteVO {
	private int user_num;
	private int product_no;
	private String product_name;
	private String product_category;
	private int product_price;
	private int product_stock;
	private int product_brand;
	private String product_skintype;
	private int event_no;
	private String brand_name;
	private String image_name;
	private String image_type;
	private String image_save_name;
	
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
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
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
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getImage_type() {
		return image_type;
	}
	public void setImage_type(String image_type) {
		this.image_type = image_type;
	}
	public String getImage_save_name() {
		return image_save_name;
	}
	public void setImage_save_name(String image_save_name) {
		this.image_save_name = image_save_name;
	}
	
	@Override
	public String toString() {
		return "MyPgVoteVO [user_num=" + user_num + ", product_no=" + product_no + ", product_name=" + product_name
				+ ", product_category=" + product_category + ", product_price=" + product_price + ", product_stock="
				+ product_stock + ", product_brand=" + product_brand + ", product_skintype=" + product_skintype
				+ ", event_no=" + event_no + ", brand_name=" + brand_name + ", image_name=" + image_name
				+ ", image_type=" + image_type + ", image_save_name=" + image_save_name + "]";
	}

}
