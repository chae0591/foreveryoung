package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Product;

@Repository
public interface ProductRepository {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map);
	
	public List<Product> categoryList(String category);
}
