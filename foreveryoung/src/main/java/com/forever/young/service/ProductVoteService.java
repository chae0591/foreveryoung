package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Vote;

public interface ProductVoteService {
	
	public void inVote(Map<String, Object> vote);
	public void delVote(Map<String, Object> vote);
	public List<String> findVote(int user_num);
	public Vote checkVote(int user_num,int product_no);
}
