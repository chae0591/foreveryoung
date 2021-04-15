package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

@Repository
public interface BrandRegistRepository {
	public void regist(Brand brand) throws Exception;
	public Brand login(Brand brand) throws Exception;
	public Brand findId(String brand_id) throws Exception;
	public Brand findNum(int bradn_num) throws Exception;
	public void editBrandInfo(Brand brand)  throws Exception; 

	//브랜드 판매 상품 리스트 
	public List<Product> getFindBrandProduct(Product product); 
}
