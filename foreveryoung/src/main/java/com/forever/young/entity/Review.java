package com.forever.young.entity;

import java.sql.Date;

public class Review {
	private int product_no;
	private int user_num;
	private int brand_num;
	private int review_num;
	private String review_title;
	private String review_content;
	private Date review_date;
	private int review_score;
	public Review() {
		super();
	}
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
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	@Override
	public String toString() {
		return "Review [product_no=" + product_no + ", user_num=" + user_num + ", brand_num=" + brand_num
				+ ", review_num=" + review_num + ", review_title=" + review_title + ", review_content=" + review_content
				+ ", review_date=" + review_date + ", review_score=" + review_score + "]";
	}
	
}
