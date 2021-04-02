package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.forever.young.entity.Product;
import com.forever.young.entity.ProductFileUpload;
import com.forever.young.repository.ProductFileUploadRepository;
import com.forever.young.repository.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired 
	private ProductRepository productRepository; 
	
	@Autowired
	private ProductFileUploadRepository productUploadRepo;
	
	
	@Transactional
	@Override
	public void registProduct(Product product) throws Exception {
		productRepository.registProduct(product);
		
		if(product.getUploadFileList() == null || product.getUploadFileList().size() <= 0) {
			return;
		}
		product.getUploadFileList().forEach(upload -> {
			upload.setProduct_id(product.getProduct_id());
			productUploadRepo.insert(upload);
		});
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return productRepository.selectBoardList(map);
	}

	// 카테고리별 리스트
	@Override
	public List<Product> productList(String category) {
		return productRepository.categoryList(category);
	}
	
	


}
