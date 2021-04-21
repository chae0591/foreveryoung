package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Product;

public interface MainRepository {
	
	public List<Product> productList() throws Exception;
	
}
