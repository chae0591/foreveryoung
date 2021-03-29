package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Customer;

@Repository
public interface CustomerRepository {
	
	public void regist(Customer customer) throws Exception;
}
