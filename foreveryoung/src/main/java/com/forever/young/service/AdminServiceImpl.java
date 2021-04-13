package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;
import com.forever.young.entity.Event;
import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;
import com.forever.young.entity.ProductVO;
import com.forever.young.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository repository;

	@Override
	public Admin login(Admin admin) throws Exception {
		return repository.login(admin) ;
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
	
	@Override
	public List<ProductVO> productList() throws Exception {
		return repository.productList();
	}

	@Override
	public List<Event> eventList() throws Exception {
		return repository.eventList();
	}

	@Override
	public List<Notice> noticeList() throws Exception {
		return repository.noticeList();
	}

	@Override
	public List<InquiryVO> inquiryList() throws Exception {
		return repository.inquiryList();
	}

	@Override
	public void eventRegister(Event event) throws Exception {
		 repository.eventRegister(event);
	}

	@Override
	public void noticeRegister(Notice notice) throws Exception {
		repository.noticeRegister(notice);
	}

	@Override
	public Notice noticeDetail(Integer notice_no) throws Exception {
		return repository.noticeDetail(notice_no);
	}

	@Override
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception {
		return repository.inquiryDetail(inquiry_no);
	}

	@Override
	public void noticeModify(Notice notice) throws Exception {
		repository.noticeModify(notice);
		
	}

	@Override
	public void noticeDelete(Integer notice_no) throws Exception {
		repository.noticeDelete(notice_no);
	}

	@Override
	public void replyRegister(InquiryVO inquiryVO) throws Exception {
		repository.replyRegister(inquiryVO);
	}

//	@Override
//	public void inquiryStatusComplete(InquiryVO inquiryVO) throws Exception {
//		repository.inquiryStatusComplete(inquiryVO);
//	}
	
	@Override
	public Admin adminDetail(Integer admin_no) throws Exception {
		return repository.adminDetail(admin_no);
	}
	
	@Override
	public void adminModify(Admin admin) throws Exception {
		repository.adminModify(admin);
	}

	@Override
	public void adminDelete(Integer admin_no) throws Exception {
		repository.adminDelete(admin_no);
	}








	

	
	
}
