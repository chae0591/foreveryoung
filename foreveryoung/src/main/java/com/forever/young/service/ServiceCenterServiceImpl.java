package com.forever.young.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.repository.ServiceCenterRepository;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	private static final Logger log =
			LoggerFactory.getLogger(ServiceCenterServiceImpl.class);
	
	@Autowired
	private ServiceCenterRepository repository;

	@Override
	public List<Notice> noticeList() throws Exception {
		return repository.noticeList();
	}
	
	@Override
	 public List<Inquiry> inquiryList(Integer user_num) throws Exception {
	      return repository.inquiryList(user_num);
	 }
	
	@Override
	public void inquiryRegister(Inquiry inquiry) throws Exception {
		repository.inquiryRegister(inquiry);
	}
	
	@Override
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception {
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
	
	@Override
	public int inquiryRegisterAfter() throws Exception {
		return repository.inquiryRegisterAfter();
	}

}