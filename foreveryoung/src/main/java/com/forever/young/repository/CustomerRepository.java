package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Customer;

@Repository
public interface CustomerRepository {
	
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
}
