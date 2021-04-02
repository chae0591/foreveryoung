package com.forever.young.entity;

import java.sql.Date;
import java.util.List;

public class Product {
	private int product_id;
	private String product_category;
	private String product_name; 
	private int product_price;
	private int product_stock;
	private Date product_regDate;
	private int product_brand;
	private String product_skintype;
	private int event_no;
	
	private List<ProductFileUpload> uploadFileList;
	

	public Product() {
		super();
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
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

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public Date getProduct_regDate() {
		return product_regDate;
	}

	public void setProduct_regDate(Date product_regDate) {
		this.product_regDate = product_regDate;
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

	public List<ProductFileUpload> getUploadFileList() {
		return uploadFileList;
	}

	public void setUploadFileList(List<ProductFileUpload> uploadFileList) {
		this.uploadFileList = uploadFileList;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_category=" + product_category + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_regDate=" + product_regDate + ", product_brand=" + product_brand + ", product_skintype="
				+ product_skintype + ", event_no=" + event_no + ", uploadFileList=" + uploadFileList + "]";
	}
	
	

}
