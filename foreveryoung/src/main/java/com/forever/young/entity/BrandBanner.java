package com.forever.young.entity;

public class BrandBanner {
	
	private int ban_no;
	private int brand_num;
	private String text;
	private BrandBannerImg ban_img;
	
	public BrandBanner() {
		super();
	}
	public int getBan_no() {
		return ban_no;
	}
	public void setBan_no(int ban_no) {
		this.ban_no = ban_no;
	}
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public BrandBannerImg getBan_img() {
		return ban_img;
	}
	public void setBan_img(BrandBannerImg ban_img) {
		this.ban_img = ban_img;
	}
	@Override
	public String toString() {
		return "BrandBanner [ban_no=" + ban_no + ", brand_num=" + brand_num + ", text=" + text + ", ban_img=" + ban_img
				+ "]";
	}
	
	

}
