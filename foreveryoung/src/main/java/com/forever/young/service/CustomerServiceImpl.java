package com.forever.young.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Customer;
import com.forever.young.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerRepository repository;
	
	@Override
	public void regist(Customer customer) throws Exception {
		repository.regist(customer);
	}
}
