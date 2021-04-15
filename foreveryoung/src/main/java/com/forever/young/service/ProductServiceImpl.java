package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;
import com.forever.young.repository.ProductFileUploadRepository;
import com.forever.young.repository.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired 
	private ProductRepository productRepository; 
	
	@Autowired
	private ProductFileUploadRepository productUploadRepo;
	
	@Override
	public void registProduct(Product product) throws Exception {
		productRepository.registProduct(product);
		
		if(product.getUploadFileList() == null || product.getUploadFileList().size() <= 0) {
			return;
		}
		
		product.getUploadFileList().forEach(upload -> {
			upload.setProduct_no((product.getProduct_no()));
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

	@Override
	public List<Product> productListSearch(Map<String, Object> searchData) {
		return productRepository.productListSearch(searchData);
	}

	@Override
	public List<Brand> getBrand() {
		return productRepository.getBrand();
	}

	@Override
	public int getCount(String category) {
		return productRepository.getCount(category);
	}

	@Override
	public List<Product> brandList(int brand) {
		return productRepository.brandList(brand);
	}

	@Override
	public List<Product> brandListSearch(Map<String, Object> searchData) {
		return productRepository.brandListSearch(searchData);
	}

	@Override
	public int getCountByBrand(int brand) {
		return productRepository.getCountByBrand(brand);
	}

	@Override
	public List<Product> getBest(String category) {
		return productRepository.getBest(category);
	}

	//테스트
	@Override
	public List<Product> getFindBrandProduct(Product product) {
		return productRepository.getFindBrandProduct(product);
	}
}
