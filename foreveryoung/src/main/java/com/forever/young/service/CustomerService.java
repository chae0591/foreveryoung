package com.forever.young.service;

import java.util.List;
import java.util.Map;

import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;
import com.forever.young.entity.MyPgInquiryVO;
import com.forever.young.entity.MyPgReviewVO;
import com.forever.young.entity.MyPgVoteVO;

public interface CustomerService {
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
	public Customer findNum(int user_num) throws Exception;
	public void editInfo(Customer customer) throws Exception;
	public void editPw(ChangePwVO changePwVO) throws Exception;
	public List<MyPgInquiryVO> findNumInquiry(int user_num, int day_num) throws Exception;
	public List<MyPgVoteVO> myVoteList(int user_num) throws Exception;
	public List<MyPgInquiryVO> searchInquiryDate(Map<String, Object> param) throws Exception;
	public List<MyPgInquiryVO> searchInquiryTarget(Map<String, Object> param) throws Exception;
	public List<MyPgReviewVO> myReviewList(int user_num, int day_num) throws Exception;
	public List<MyPgReviewVO> searchReviewDate(Map<String, Object> param) throws Exception;
	public List<MyPgReviewVO> searchReviewTarget(Map<String, Object> param) throws Exception;
}
