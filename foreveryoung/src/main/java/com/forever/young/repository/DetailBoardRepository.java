package com.forever.young.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;
import com.forever.young.entity.Review;


public interface DetailBoardRepository {
	public Product getDetail(Integer product_no) throws Exception;
	public List<Product> productList()throws Exception;
	public List<Review> reviewList(int product_no) throws Exception;
}
