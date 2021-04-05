package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Product;

public interface ProductService {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap);
	
	// 카테고리별 리스트
	public List<Product> productList(String category);
}
