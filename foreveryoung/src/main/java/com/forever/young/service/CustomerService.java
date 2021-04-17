package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;
import com.forever.young.entity.MyPgInquiryVO;

public interface CustomerService {
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
	public Customer findNum(int user_num) throws Exception;
	public void editInfo(Customer customer) throws Exception;
	public void editPw(ChangePwVO changePwVO) throws Exception;
	public List<MyPgInquiryVO> findNumInquiry(int user_num) throws Exception;
}
