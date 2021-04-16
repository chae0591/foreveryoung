package com.forever.young.entity;

public class ReviewFileUpload {
	
	private int image_review_no;
	private String image_name;
	private String image_save_name;
	private int file_size;
	private String file_type;
	private int review_num;
	private int user_num;
	public ReviewFileUpload() {
		super();
	}
	public int getImage_review_no() {
		return image_review_no;
	}
	public void setImage_review_no(int image_review_no) {
		this.image_review_no = image_review_no;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getImage_save_name() {
		return image_save_name;
	}
	public void setImage_save_name(String image_save_name) {
		this.image_save_name = image_save_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
}
