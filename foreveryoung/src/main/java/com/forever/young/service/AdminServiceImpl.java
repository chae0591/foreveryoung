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
	public int getCountByAdmin() {
		return repository.getCountByAdmin();
	}

	@Override
	public List<Brand> brandList() throws Exception {
		return repository.brandList();
	}
	
	@Override
	public int getCountByBrand() {
		return repository.getCountByBrand();
	}

	@Override
	public List<Customer> customerList() throws Exception {
		return repository.customerList();
	}
	
	@Override
	public int getCountByCustomer() {
		return repository.getCountByCustomer();
	}
	
	@Override
	public List<ProductVO> productList() throws Exception {
		return repository.productList();
	}
	
	@Override
	public int getCountByProduct() {
		return repository.getCountByProduct();
	}

	@Override
	public List<Event> eventList() throws Exception {
		return repository.eventList();
	}
	
	@Override
	public int getCountByEvent() {
		return repository.getCountByEvent();
	}

	@Override
	public List<Notice> noticeList() throws Exception {
		return repository.noticeList();
	}
	
	@Override
	public int getCountByNotice() {
		return repository.getCountByNotice();
	}

	@Override
	public List<InquiryVO> inquiryList() throws Exception {
		return repository.inquiryList();
	}
	
	@Override
	public int getCountByInquiry() {
		return repository.getCountByInquiry();
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

	@Override
	public Event eventDetail(Integer event_no) throws Exception {
		return repository.eventDetail(event_no);
	}

	@Override
	public void eventModify(Event event) throws Exception {
		repository.eventModify(event);
	}

	@Override
	public void eventDelete(Integer event_no) throws Exception {
		repository.eventDelete(event_no);
	}

	@Override
	public void replyModify(InquiryVO inquiryVO) throws Exception {
		repository.replyModify(inquiryVO);
	}

	@Override
	public void replyDelete(Integer inquiry_no) throws Exception {
		repository.replyDelete(inquiry_no);
	}


	
	
}
