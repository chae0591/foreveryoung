package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;
import com.forever.young.entity.Event;
import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;
import com.forever.young.entity.ProductVO;

@Repository
public interface AdminRepository {

	public Admin login(Admin admin) throws Exception;
	
	public void join(Admin amdin) throws Exception;
	
	public List<Admin> adminList() throws Exception;
	
	public List<Brand> brandList() throws Exception;
	
	public List<Customer> customerList() throws Exception;
	
	public List<ProductVO> productList() throws Exception; 
	
	public List<Event> eventList() throws Exception;
	
	public List<Notice> noticeList() throws Exception;
	
	public List<Inquiry> inquiryList() throws Exception;
	
	
}
