package com.forever.young.entity;

public class BrandBannerImg {
	
	private int ban_img_no;
	private int ban_no;
	private String image_save_name;
	private String image_name;
	private int file_size;
	private String file_type;
	
	public BrandBannerImg() {
		super();
	}
	public int getBan_img_no() {
		return ban_img_no;
	}
	public void setBan_img_no(int ban_img_no) {
		this.ban_img_no = ban_img_no;
	}
	public int getBan_no() {
		return ban_no;
	}
	public void setBan_no(int ban_no) {
		this.ban_no = ban_no;
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
	@Override
	public String toString() {
		return "BrandImg [ban_img_no=" + ban_img_no + ", ban_no=" + ban_no + ", image_save_name="
				+ image_save_name + ", image_name=" + image_name + ", file_size=" + file_size + ", file_type="
				+ file_type + "]";
	}
	

}
