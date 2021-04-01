package com.forever.young.service;

import com.forever.young.entity.Customer;

public interface CustomerService {
	public void regist(Customer customer) throws Exception;
	public boolean login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
}
