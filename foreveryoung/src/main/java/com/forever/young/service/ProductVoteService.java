package com.forever.young.service;

import java.util.List;

public interface ProductVoteService {
	
	public void inVote(int product_no, int user_num);
	public void delVote(int product_no, int user_num);
	public List<String> findVote(int user_num);
}
