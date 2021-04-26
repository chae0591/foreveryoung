package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.BrandBannerImg;

@Repository
public interface BrandBannerImgRepository {
	
	public void brand_img(BrandBannerImg img);
	public BrandBannerImg getBanImg(int ban_no);
	public void delBanImg(int ban_no);
}
