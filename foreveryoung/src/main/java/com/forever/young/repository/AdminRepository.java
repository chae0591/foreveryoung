package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;

@Repository
public interface AdminRepository {

	public Admin login(Admin admin) throws Exception;
	
	public void join(Admin amdin) throws Exception;
	
	public List<Admin> adminList() throws Exception;
	
	public List<Brand> brandList() throws Exception;
	
	public List<Customer> customerList() throws Exception;
	
	
}
