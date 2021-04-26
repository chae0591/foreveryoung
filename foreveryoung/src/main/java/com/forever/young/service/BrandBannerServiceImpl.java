package com.forever.young.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.BrandBanner;
import com.forever.young.entity.BrandBannerImg;
import com.forever.young.repository.BrandBannerImgRepository;
import com.forever.young.repository.BrandBannerRepository;

@Service
public class BrandBannerServiceImpl implements BrandBannerService{

	@Autowired
	BrandBannerRepository repo;
	
	@Autowired
	BrandBannerImgRepository imgRepo;
	
	@Override
	public void banInsert(BrandBanner ban) {
		repo.banInsert(ban);
		System.out.println(ban.getBan_no());
		BrandBannerImg img = ban.getBan_img();
		img.setBan_no(ban.getBan_no());
		imgRepo.brand_img(img);
	}

	@Override
	public BrandBanner getBan(int brand_num) {
		BrandBanner ban = new BrandBanner();
		ban = repo.getBan(brand_num);
		ban.setBan_img(imgRepo.getBanImg(ban.getBan_no()));
		return ban; 
	}

	@Override
	public void delBan(int brand_num) {
		repo.delBan(brand_num);
	}

	@Override
	public void upBan(BrandBanner ban) {
		repo.upBan(ban);
		
		if(ban.getBan_img() != null) {
			imgRepo.delBanImg(ban.getBan_no());
			BrandBannerImg img = ban.getBan_img();
			img.setBan_no(ban.getBan_no());
			System.out.println(img.getBan_no());
			imgRepo.brand_img(img);
		}
	}

}
