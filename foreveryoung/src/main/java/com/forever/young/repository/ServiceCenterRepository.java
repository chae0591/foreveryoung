package com.forever.young.repository;

import java.util.List;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;

public interface ServiceCenterRepository {

	public List<Notice> noticeList() throws Exception;
	
	public List<Inquiry> inquiryList(int user_num) throws Exception;
	
	public void inquiryRegister(Inquiry inquiry) throws Exception;
	
	public Inquiry inquiryDetail(Integer inquiry_no) throws Exception;
	
	public void inquiryModify(Inquiry inquiry_no) throws Exception;
	
	public void inquiryDelete(Integer inquiry_no) throws Exception;

	public Integer getUser_num() throws Exception;

	public void addAttach(Integer userNum) throws Exception;

}
