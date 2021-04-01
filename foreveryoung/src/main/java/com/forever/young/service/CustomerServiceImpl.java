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
	
	@Override
	public Customer login(Customer customer) throws Exception {
		System.out.println("checkService : " + customer.getUser_id());
		System.out.println("checkService : " + customer.getUser_pw());
		System.out.println("checkService : " + repository.login(customer));
		return repository.login(customer);
	}
	
	@Override
	public Customer findId(String user_id) throws Exception {
		return repository.findId(user_id);
	}
}
