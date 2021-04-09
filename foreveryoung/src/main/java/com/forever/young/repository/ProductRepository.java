package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

@Repository
public interface ProductRepository {
	public void registProduct(Product product) throws Exception;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map);
	
	public List<Product> categoryList(String category);
	public List<Product> productListSearch(@Param("category") String cateogry, @Param("sType") String[] sTyp, int[] sBrand);
	
	public List<Brand> getBrand();
	public int getCount(String category);
}
