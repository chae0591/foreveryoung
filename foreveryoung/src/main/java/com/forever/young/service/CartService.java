package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Cart;

public interface CartService {
	public List<Cart> searchListUser(int user_num) throws Exception;
}
