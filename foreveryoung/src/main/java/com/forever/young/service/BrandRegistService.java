
package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

public interface BrandRegistService {
	public void regist(Brand Brand) throws Exception;
	public Brand login(Brand Brand) throws Exception;
	public Brand findId(String brand_id) throws Exception;
	public Brand findNum(int brand_num) throws Exception;
	public void editBrandInfo(Brand brand) throws Exception; 
	
	//상품 리스트 
	public List<Product> brandList(int brand);
	public int getCountByBrand(int brand);
	
	//판매자 페이지 상품 페이징 
	public List<Product> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	//브랜드 상품 수정 및 삭제 
	public void update(Product product) throws Exception; 
	public void deleteProduct(int product_no) throws Exception; 
	
}