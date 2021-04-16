package com.forever.young.repository;

import java.util.List;

import com.forever.young.entity.Product;


public interface DetailBoardRepository {
	public List<Product> mainList()throws Exception;
}
