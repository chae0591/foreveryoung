package com.forever.young.repository;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;

public interface ServiceCenterRepository {

	public List<Notice> noticeList() throws Exception;
	
	public List<Inquiry> inquiryList(Integer user_num) throws Exception;
	
	public void inquiryRegister(Inquiry inquiry) throws Exception;
	
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception;
	
	public void inquiryModify(Inquiry inquiry_no) throws Exception;
	
	public void inquiryDelete(Integer inquiry_no) throws Exception;

	public int inquiryRegisterAfter() throws Exception;

	public List<Notice> noticeAll(int start, int end, String keyword) throws Exception;

	public List<Notice> noticeAll(String string, Map<String, Object> map) throws Exception;

	public int countArticle(String keyword) throws Exception;

}