package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

public interface ProductService {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap);
	public List<Brand> getBrand();

	// 카테고리별 리스트
	public List<Product> productList(String category);
	public List<Product> productListSearch(Map<String, Object> searchData);
	public int getCount(String category);
	
	// 브랜드
	public List<Product> brandList(int brand);
	public List<Product> brandListSearch(Map<String, Object> searchData);
	public int getCountByBrand(int brand);
	

	public Product findByNo(int no);

	// 베스트 상품
	public List<Product> getBest(String category);

}
