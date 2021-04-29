package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Notice;
import com.forever.young.entity.Product;

public interface MainRepository {
	
	public List<Product> randomList() throws Exception;
	public List<Product> bestList(String lankval) throws Exception;
	public List<Product> newList() throws Exception;
	
	public List<Product> searchList(String keyword) throws Exception;


}
