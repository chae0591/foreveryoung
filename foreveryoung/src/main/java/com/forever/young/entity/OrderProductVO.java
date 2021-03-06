package com.forever.young.entity;

public class OrderProductVO {
	private int product_no;
	private int product_brand;
	private String product_name;
	private String product_category;
	private int product_price;
	private String brand_name;
	private String product_skintype;
	private int cart_count;
	
	private String image_save_name;
	private String image_type;
	private String image_name; 
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(int product_brand) {
		this.product_brand = product_brand;
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
		return "OrderProductVO [product_no=" + product_no + ", product_brand=" + product_brand + ", product_name="
				+ product_name + ", product_category=" + product_category + ", product_price=" + product_price
				+ ", brand_name=" + brand_name + ", product_skintype=" + product_skintype + ", cart_count=" + cart_count
				+ ", image_save_name=" + image_save_name + ", image_type=" + image_type + ", image_name=" + image_name
				+ "]";
	}
	
	
}
