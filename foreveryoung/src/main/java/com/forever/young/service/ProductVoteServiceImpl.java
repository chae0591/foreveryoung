package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Vote;
import com.forever.young.repository.ProductVoteRepository;

@Service("ProductVoteService")
public class ProductVoteServiceImpl implements ProductVoteService{

	@Autowired
	private ProductVoteRepository voteRepository;
	
	@Override
	public void inVote(Map<String, Object> vote) {
		voteRepository.inVote(vote);
	}

	@Override
	public void delVote(Map<String, Object> vote) {
		voteRepository.delVote(vote);
		
	}

	@Override
	public List<String> findVote(int user_num) {
		
		return voteRepository.findVote(user_num);
	}

	@Override
	public Vote checkVote(int user_num, int product_no) {
		// TODO Auto-generated method stub
		return voteRepository.checkVote(user_num,product_no);
	}

	
}
