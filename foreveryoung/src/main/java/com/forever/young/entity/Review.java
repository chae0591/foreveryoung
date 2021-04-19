package com.forever.young.entity;

import java.sql.Date;
import java.util.List;

public class Review {
	private int prodcut_no;
	private int user_num;
	private int brand_num;
	private int review_num;
	private String brand_title;
	private String brand_content;
	private Date review_date;
	private int review_score;
	
	private String image_save_name;
	private String file_type;
	
	private List<ReviewFileUpload> uploadreviewList;

	public Review() {
		super();
	}

	public int getProdcut_no() {
		return prodcut_no;
	}

	public void setProdcut_no(int prodcut_no) {
		this.prodcut_no = prodcut_no;
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

	public String getBrand_title() {
		return brand_title;
	}

	public void setBrand_title(String brand_title) {
		this.brand_title = brand_title;
	}

	public String getBrand_content() {
		return brand_content;
	}

	public void setBrand_content(String brand_content) {
		this.brand_content = brand_content;
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

	public String getImage_save_name() {
		return image_save_name;
	}

	public void setImage_save_name(String image_save_name) {
		this.image_save_name = image_save_name;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public List<ReviewFileUpload> getUploadreviewList() {
		return uploadreviewList;
	}

	public void setUploadreviewList(List<ReviewFileUpload> uploadreviewList) {
		this.uploadreviewList = uploadreviewList;
	}
}
