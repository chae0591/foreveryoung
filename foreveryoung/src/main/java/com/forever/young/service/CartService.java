package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.CartListVO;

public interface CartService {
	public List<CartListVO> searchListUser(int user_num) throws Exception;
}
