package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Paging;
import com.forever.young.entity.Product;
import com.forever.young.entity.ProductFile;

@Repository
public interface ProductRepository {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map);

	public List<Brand> getBrand();
	
	//카테고리
	public List<Product> categoryList(String category);
	public List<Product> productListSearch(Map<String, Object> searchData);
	public int getCount(String category);
	
	//페이징
	public List<Product> categoryListWithPaging(String category, Paging paging);
	public List<Product> productListSearchWithPaging(Map<String, Object> searchData);
	
	//브랜드
	public List<Product> brandList(int brand);
	public List<Product> brandListSearch(Map<String, Object> searchData);
	public int getCountByBrand(int brand);

	//베스트상품
	public List<Product> getBest(String category);

	public List<Product> getFindBrandProduct(Product product);

}
