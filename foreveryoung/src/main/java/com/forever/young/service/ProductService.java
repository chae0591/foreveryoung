package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Paging;
import com.forever.young.entity.Product;
import com.forever.young.entity.ProductFile;

public interface ProductService {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap);
	public List<Brand> getBrand();

	// 카테고리별 리스트
	public List<Product> productList(String category);
	public List<Product> productListSearch(Map<String, Object> searchData);
	public int getCount(String category);
	
	//페이징
	public List<Product> categoryListWithPaging(String category, Paging paging);
	public List<Product> productListSearchWithPaging(Map<String, Object> searchData);
	
	// 브랜드
	public List<Product> brandList(int brand);
	public List<Product> brandListSearch(Map<String, Object> searchData);
	public int getCountByBrand(int brand);
	


	// 베스트 상품
	public List<Product> getBest(String category);

	
	//테스트 - 준식 
	public List<Product> getFindBrandProduct(Product product);
}
