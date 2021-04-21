package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Order;
import com.forever.young.entity.OrderMypgVO;
import com.forever.young.entity.OrderProductVO;

@Repository
public interface OrderRepository {
	public void addOrder(Order order_temp) throws Exception;
	public List<Order> searchUserOrder(int user_num) throws Exception;
	public OrderProductVO searchproVO(int product_no) throws Exception;
	public List<OrderMypgVO> searchListMyPg(int user_num, int day_num) throws Exception;
	public List<OrderMypgVO> searchListMyPgDate(Map<String, Object> param) throws Exception;
	public List<OrderMypgVO> searchListMyPgTarget(Map<String, Object> param) throws Exception;
}
