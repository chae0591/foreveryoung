package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Review;
import com.forever.young.repository.ReviewRepository;

@Service("reviewservice")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewRepository reviewrepository;
	
	@Override
	public List<Review> reviewlist(int product_no) throws Exception {
		
		return reviewrepository.reviewlist(product_no);
	}

}
