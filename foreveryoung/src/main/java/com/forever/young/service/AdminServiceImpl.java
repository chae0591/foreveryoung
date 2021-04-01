package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;
import com.forever.young.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository repository;

	@Override
	public boolean login(Admin admin) throws Exception {
		
		return repository.login(admin) != null ;
	}
	
	@Override
	public void join(Admin amdin) throws Exception {
		repository.join(amdin);
	}

	@Override
	public List<Admin> adminList() throws Exception {
		return repository.adminList();
	}

	@Override
	public List<Brand> brandList() throws Exception {
		return repository.brandList();
	}

	@Override
	public List<Customer> customerList() throws Exception {
		return repository.customerList();
	}


	

	
	
}
