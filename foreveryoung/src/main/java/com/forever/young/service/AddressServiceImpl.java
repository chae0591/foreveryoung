package com.forever.young.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Address;
import com.forever.young.entity.OrderVO;
import com.forever.young.repository.AddressRepository;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressRepository repository;
	
	@Override
	public void addAddress(Address address) throws Exception {
		repository.addAddress(address);
	}
	
	@Override
	public List<Address> searchAddress(int address_customer) throws Exception {
		return repository.searchAddress(address_customer);
	}
	
	@Override
	public void delAddressItem(int address_no) throws Exception {
		repository.delAddressItem(address_no);
	}
	
	@Override
	public void delAddressItems(int[] addressArr) throws Exception {
		repository.delAddressItems(addressArr);
	}
	
	@Override
	public void selectAddressItem(int user_no, int address_no) throws Exception {
		repository.selAddressItem(user_no, address_no);
	}
	
	@Override
	public Address selectAddressNum(int address_no) throws Exception {
		return repository.selectAddressNum(address_no);
	}
	
	@Override
	public void addVO(OrderVO orderVO) throws Exception {
		repository.addVO(orderVO);
	}
	
	@Override
	public Address searchSelAddress(int user_num) throws Exception {
		return repository.searchSelAddress(user_num);
	}
}
