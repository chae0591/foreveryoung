package com.forever.young.entity;

import java.sql.Date;

public class MyPgReviewVO {
	private int product_no;
	private int user_num;
	private int brand_num;
	private int review_num;
	private String review_title;
	private String review_content;
	private int review_score;
	private Date review_date;
	private String product_name;
	private int product_price;
	private String brand_name;
	private String image_save_name;
	private String image_name;
	private String image_type;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
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
	
	@Override
	public String toString() {
		return "MyPgReviewVO [product_no=" + product_no + ", user_num=" + user_num + ", brand_num=" + brand_num
				+ ", review_num=" + review_num + ", review_title=" + review_title + ", review_content=" + review_content
				+ ", review_score=" + review_score + ", review_date=" + review_date + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", brand_name=" + brand_name + ", image_save_name="
				+ image_save_name + ", image_name=" + image_name + ", image_type=" + image_type + "]";
	}
}
