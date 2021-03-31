package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Product;
import com.forever.young.repository.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired 
	private ProductRepository productRepository; 
	
	@Override
	public void registProduct(Product product) throws Exception {
		productRepository.registProduct(product);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return productRepository.selectBoardList(map);
	}

}
