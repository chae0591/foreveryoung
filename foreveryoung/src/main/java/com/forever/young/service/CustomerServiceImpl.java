package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;
import com.forever.young.entity.MyPgInquiryVO;
import com.forever.young.entity.MyPgVoteVO;
import com.forever.young.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerRepository repository;
	
	@Override
	public void regist(Customer customer) throws Exception {
		repository.regist(customer);
	}
	
	@Override
	public Customer login(Customer customer) throws Exception {
		
		return repository.login(customer);
	}
	
	@Override
	public Customer findId(String user_id) throws Exception {
		return repository.findId(user_id);
	}
	
	@Override
	public Customer findNum(int user_num) throws Exception {
		return repository.findNum(user_num);
	}
	
	@Override
	public void editInfo(Customer customer) throws Exception {
		repository.editInfo(customer);		
	}
	
	@Override
	public void editPw(ChangePwVO changePwVO) throws Exception {
		repository.editPw(changePwVO);
	}
	
	@Override
	public List<MyPgInquiryVO> findNumInquiry(int user_num, int day_num) throws Exception {
		return repository.findInquiry(user_num, day_num);
	}
	
	@Override
	public List<MyPgVoteVO> myVoteList(int user_num) throws Exception {
		return repository.myVoteList(user_num);
	}
	
	@Override
	public List<MyPgInquiryVO> searchInquiryDate(Map<String, Object> param) throws Exception {
		return repository.searchInquiryDate(param);
	}
	
	@Override
	public List<MyPgInquiryVO> searchInquirTarget(Map<String, Object> param) throws Exception {
		return repository.searchInquirTarget(param);
	}
}
