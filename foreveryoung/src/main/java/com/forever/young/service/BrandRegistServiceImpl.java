package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;
import com.forever.young.repository.BrandRegistRepository;
import com.forever.young.repository.ProductRepository;

@Service
public class BrandRegistServiceImpl implements BrandRegistService{
	@Autowired
	private BrandRegistRepository repository;
	
	@Autowired 
	private ProductRepository productRepository; 
	
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
	
	@Override
	public void editBrandInfo(Brand brand) throws Exception {
		repository.editBrandInfo(brand); 
	}

	@Override
	public List<Product> brandList(int brand) {
		return productRepository.brandList(brand);
	}

	@Override
	public int getCountByBrand(int brand) {
		return productRepository.getCountByBrand(brand);
	}

}
