package com.forever.young.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.repository.ServiceCenterRepository;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;
import com.forever.young.entity.Paging;

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
	 public List<Inquiry> inquiryList(Integer user_num, int monthval) throws Exception {
	      return repository.inquiryList(user_num, monthval);
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
	public void inquiryModify(Inquiry inquiry_no) throws Exception {
		repository.inquiryModify(inquiry_no);
	}
	
	@Override
	public void inquiryDelete(Integer inquiry_no) throws Exception {
		repository.inquiryDelete(inquiry_no);
	}

	@Override
	public int inquiryRegisterAfter() throws Exception {
		return repository.inquiryRegisterAfter();
	}
	
	//목록 (페이지 나누기, 검색 기능을 포함)
    //매개변수는 시작 레코드 번호, 끝번호, 옵션과 키워드가 들어간다.
	
	@Override
	public List<Notice> listAll(String keyword, String typeval) throws Exception {
		return repository.listAll(keyword, typeval);
	}


}