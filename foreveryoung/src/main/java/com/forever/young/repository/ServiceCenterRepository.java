package com.forever.young.repository;

import java.util.List;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;

public interface ServiceCenterRepository {

	public List<Notice> noticeList() throws Exception;
	
	public List<Inquiry> inquiryList() throws Exception;
	
	public void inquiryRegister(Inquiry inquiry) throws Exception;
	
	public Inquiry inquiryDetail(Integer inquiry_no) throws Exception;
	
	public void inquiryModify(Inquiry inquiry_no) throws Exception;
	
	public void inquiryDelete(Integer inquiry_no) throws Exception;

}