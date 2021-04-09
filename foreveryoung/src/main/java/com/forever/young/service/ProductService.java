package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

public interface ProductService {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap);
	
	// 카테고리별 리스트
	public List<Product> productList(String category);
	public List<Product> productListSearch(String category, String[] sType, int[] sBrand);
	
	public List<Brand> getBrand();
	
	public int getCount(String category);
}
