package com.forever.young.entity;

public class ProductFile {
	
	private int product_id;
	private String image_name;
	private String image_save_name;
	private int file_size;
	private String file_type;
	
	
	public ProductFile() {
		super();
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	
	
	

}
