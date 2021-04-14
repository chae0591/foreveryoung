package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.repository.ServiceCenterRepository;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	@Autowired
	private ServiceCenterRepository repository;

	@Override
	public List<Notice> noticeList() throws Exception {
		return repository.noticeList();
	}
	
	@Override
	public List<Inquiry> inquiryList() throws Exception {
		return repository.inquiryList();
	}
	
	@Override
	public void inquiryRegister(Inquiry inquiry) throws Exception {
		repository.inquiryRegister(inquiry);
	}
	
	@Override
	public Inquiry inquiryDetail(Integer inquiry_no) throws Exception {
		return repository.inquiryDetail(inquiry_no);
	}
	
	@Override
	public void inquiryModify(Inquiry inquiry) throws Exception {
		repository.inquiryModify(inquiry);
	}
	
	@Override
	public void inquiryDelete(Integer inquiry_no) throws Exception {
		repository.inquiryDelete(inquiry_no);
	}
}
