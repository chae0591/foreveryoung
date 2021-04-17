package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;
import com.forever.young.entity.MyPgInquiryVO;

@Repository
public interface CustomerRepository {
	
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
	public Customer findNum(int user_num) throws Exception;
	public void editInfo(Customer customer) throws Exception;
	public void editPw(ChangePwVO changePwVO) throws Exception;
	public List<MyPgInquiryVO> findInquiry(int user_num) throws Exception;
}
