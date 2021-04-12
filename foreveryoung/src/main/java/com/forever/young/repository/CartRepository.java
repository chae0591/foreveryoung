package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.CartListVO;

@Repository
public interface CartRepository {
	public List<CartListVO> searchListUser(int user_num) throws Exception;
	public void delCartItem(int cart_no) throws Exception;
	public void delCartItems(int[] cartArr) throws Exception;
	public List<CartListVO> searchList(int[] cartList) throws Exception;
}
