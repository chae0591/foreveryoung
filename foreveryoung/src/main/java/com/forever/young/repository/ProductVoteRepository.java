package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.forever.young.entity.Vote;

public interface ProductVoteRepository {

	public void inVote(Map<String, Object> vote);
	public void delVote(Map<String, Object> vote);
	public List<String> findVote(@Param("user_num") int user_num);
	public Vote checkVote(int user_num,int product_no);
}
