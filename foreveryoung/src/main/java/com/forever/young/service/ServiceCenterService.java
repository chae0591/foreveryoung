package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Notice;
import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;

public interface ServiceCenterService {

	public List<Notice> noticeList() throws Exception;
	
	public List<Inquiry> inquiryList(Integer user_num) throws Exception;
	
	public void inquiryRegister(Inquiry inquiry) throws Exception;
	
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception;
	
	public void inquiryModify(Inquiry inquiry_no) throws Exception;
	
	public void inquiryDelete(Integer inquiry_no) throws Exception;

	public int inquiryRegisterAfter() throws Exception;

	public List<Notice> listAll(String keyword, int start, int end) throws Exception;

}

