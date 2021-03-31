package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;

public interface AdminService {
	
	public boolean login(Admin admin) throws Exception;
	
	public void join(Admin amdin) throws Exception;

	public List<Admin> adminList() throws Exception;
	
	public List<Brand> brandList() throws Exception;
	
	public List<Customer> customerList() throws Exception;
}
