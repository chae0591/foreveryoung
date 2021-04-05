package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Brand;

@Repository
public interface BrandRegistRepository {
	public void regist(Brand brand) throws Exception;
	public Brand login(Brand brand) throws Exception;
	public Brand findId(String brand_id) throws Exception;
}
