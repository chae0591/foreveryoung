package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Product;

public interface MainService {

	public List<Product> mainList() throws Exception;
	
	public List<Product> randomList() throws Exception;
	public List<Product> bestList() throws Exception;
	public List<Product> newList() throws Exception;

	public List<Product> searchList(String keyword) throws Exception;
}
