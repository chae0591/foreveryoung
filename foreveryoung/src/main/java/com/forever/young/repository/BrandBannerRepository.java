package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.BrandBanner;

@Repository
public interface BrandBannerRepository {
	public void banInsert(BrandBanner ban);
	public BrandBanner getBan(int brand_num);
	public void delBan(int brand_num);
	public void upBan(BrandBanner ban);
}
