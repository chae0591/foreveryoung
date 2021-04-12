package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;
import com.forever.young.entity.Event;
import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
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
	
	public void eventRegister(Event event) throws Exception;
	
	public void noticeRegister(Notice notice) throws Exception;
	
	public int customerCount() throws Exception;
	
	public int brandCount() throws Exception;
	
	public int productCount() throws Exception;
	
	public Notice noticeDetail(Integer notice_no) throws Exception;
	
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception;

	public void noticeModify(Notice notice) throws Exception;
	
	public void noticeDelete(Integer notice_no) throws Exception;
	
	public void replyRegister(InquiryVO inquiryVO) throws Exception; 
	
	public void inquiryStatusComplete(InquiryVO inquiryVO) throws Exception;
	
	
}
