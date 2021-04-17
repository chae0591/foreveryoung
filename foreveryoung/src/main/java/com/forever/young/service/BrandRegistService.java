
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
	
}