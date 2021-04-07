package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Cart;

@Repository
public interface CartRepository {
	public List<Cart> searchListUser(int user_num) throws Exception;
}
