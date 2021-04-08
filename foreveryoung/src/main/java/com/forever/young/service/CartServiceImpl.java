package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.CartListVO;
import com.forever.young.repository.CartRepository;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartRepository repository;
	
	@Override
	public List<CartListVO> searchListUser(int user_num) throws Exception {
		
		return repository.searchListUser(user_num);
	}
}
