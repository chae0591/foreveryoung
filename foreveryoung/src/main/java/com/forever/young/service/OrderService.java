package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Order;
import com.forever.young.entity.OrderMypgVO;
import com.forever.young.entity.OrderProductVO;

public interface OrderService{
	public void addOrder(Order order_temp) throws Exception;
	public List<Order> searchUserNum(int user_num) throws Exception;
	public OrderProductVO searchproVO(int product_no) throws Exception;
	public List<OrderMypgVO> searchListVO(int user_num) throws Exception;
}
