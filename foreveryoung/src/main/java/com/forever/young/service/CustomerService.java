package com.forever.young.service;

import com.forever.young.entity.Customer;

public interface CustomerService {
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
	public Customer findNum(int user_num) throws Exception;
}
