package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Review;

public interface ReviewService {
	public List<Review> reviewlist(int product_no)throws Exception;
}
