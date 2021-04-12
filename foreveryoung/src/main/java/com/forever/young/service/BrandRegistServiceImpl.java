package com.forever.young.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Brand;
import com.forever.young.repository.BrandRegistRepository;

@Service
public class BrandRegistServiceImpl implements BrandRegistService{
	@Autowired
	private BrandRegistRepository repository;
	
	@Override
	public void regist(Brand brand) throws Exception {
		repository.regist(brand);
	}
	
	@Override
	public Brand login(Brand brand) throws Exception {
		return repository.login(brand);
	}
	
	@Override
	public Brand findId(String brand_id) throws Exception {
		return repository.findId(brand_id);
	}
	
	@Override
	public Brand findNum(int brand_num) throws Exception {
		return repository.findNum(brand_num);
	}
}
