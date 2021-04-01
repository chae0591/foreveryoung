package com.forever.young.service;

import com.forever.young.entity.Brand;

public interface BrandRegistService {
	public void regist(Brand Brand) throws Exception;
	public Brand login(Brand Brand) throws Exception;
	public Brand findId(String brand_id) throws Exception;
}