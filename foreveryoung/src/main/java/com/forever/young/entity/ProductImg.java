package com.forever.young.entity;

public class ProductImg {
	private int image_no;
	private int product_no;
	private String Image_name;
	private String Image_save_name;
	private int file_size;
	private String file_type;
	private String image_type;
	public ProductImg() {
		super();
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getImage_name() {
		return Image_name;
	}
	public void setImage_name(String image_name) {
		Image_name = image_name;
	}
	public String getImage_save_name() {
		return Image_save_name;
	}
	public void setImage_save_name(String image_save_name) {
		Image_save_name = image_save_name;
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
	public String getImage_type() {
		return image_type;
	}
	public void setImage_type(String image_type) {
		this.image_type = image_type;
	}
	@Override
	public String toString() {
		return "ProductImg [image_no=" + image_no + ", product_no=" + product_no + ", Image_name=" + Image_name
				+ ", Image_save_name=" + Image_save_name + ", file_size=" + file_size + ", file_type=" + file_type
				+ ", image_type=" + image_type + "]";
	}
	
}
