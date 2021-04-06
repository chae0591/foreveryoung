package com.forever.young.repository;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;

@Repository
public interface CustomerRepository {
	
	public void regist(Customer customer) throws Exception;
	public Customer login(Customer customer) throws Exception;
	public Customer findId(String user_id) throws Exception;
	public Customer findNum(int user_num) throws Exception;
	public void editInfo(Customer customer) throws Exception;
	public void editPw(ChangePwVO changePwVO) throws Exception;
}
