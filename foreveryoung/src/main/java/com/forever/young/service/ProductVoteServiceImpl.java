package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.repository.ProductVoteRepository;

@Service("ProductVoteService")
public class ProductVoteServiceImpl implements ProductVoteService{

	@Autowired
	private ProductVoteRepository voteRepository;
	
	@Override
	public void inVote(int product_no, int user_num) {
		voteRepository.inVote(product_no, user_num);
	}

	@Override
	public void delVote(int product_no, int user_num) {
		voteRepository.delVote(product_no, user_num);
		
	}

	@Override
	public List<String> findVote(int user_num) {
		
		return voteRepository.findVote(user_num);
	}

	
}
