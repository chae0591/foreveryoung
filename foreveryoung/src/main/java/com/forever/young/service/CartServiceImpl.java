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
	
	@Override
	public void delCartItem(int cart_no) throws Exception {
		repository.delCartItem(cart_no);
	}
	
	@Override
	public void delCartItems(int[] cartArr) throws Exception {
		repository.delCartItems(cartArr);
	}
	
	@Override
	public List<CartListVO> searchListNums(int[] cartList) throws Exception {
		return repository.searchList(cartList);
	}
}
