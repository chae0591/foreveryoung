package com.forever.young.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProductVoteRepository {

	public void inVote(int product_no, int user_num);
	public void delVote(int product_no, int user_num);
	public List<String> findVote(@Param("user_num") int user_num);
}
