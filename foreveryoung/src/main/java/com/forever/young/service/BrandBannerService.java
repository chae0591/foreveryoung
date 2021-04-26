package com.forever.young.service;

import com.forever.young.entity.BrandBanner;

public interface BrandBannerService {
	
	public void banInsert(BrandBanner ban);
	
	public BrandBanner getBan(int brand_num);
	public void delBan(int brand_num);
	public void upBan(BrandBanner ban);

}
