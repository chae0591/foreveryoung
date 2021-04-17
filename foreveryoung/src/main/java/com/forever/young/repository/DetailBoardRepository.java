package com.forever.young.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;


public interface DetailBoardRepository {
	public Product getDetail(Integer product_no) throws Exception;
	//public List<Product> productList()throws Exception;
}
