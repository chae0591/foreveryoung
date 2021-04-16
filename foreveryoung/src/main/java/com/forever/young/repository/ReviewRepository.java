package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Review;

@Repository
public interface ReviewRepository{
	
	public List<Review> reviewlist(int product_no)throws Exception ;
}
