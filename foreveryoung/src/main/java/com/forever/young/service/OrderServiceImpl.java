package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Order;
import com.forever.young.entity.OrderMypgVO;
import com.forever.young.entity.OrderProductVO;
import com.forever.young.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderRepository repository;
	
	@Override
	public void addOrder(Order order_temp) throws Exception {
		repository.addOrder(order_temp);
	}
	
	@Override
	public List<Order> searchUserNum(int user_num) throws Exception {
		return repository.searchUserOrder(user_num);
	}
	
	@Override
	public OrderProductVO searchproVO(int product_no) throws Exception {
		return repository.searchproVO(product_no);
	}
	
	@Override
	public List<OrderMypgVO> searchListVO(int user_num) throws Exception {
		return repository.searchListMyPg(user_num);
	}
}
