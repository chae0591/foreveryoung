package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Address;
import com.forever.young.entity.OrderVO;

@Repository
public interface AddressRepository {
	public void addAddress(Address address) throws Exception;
	
	public List<Address> searchAddress(int address_customer) throws Exception;
	
	public void delAddressItem(int address_no) throws Exception;
	
	public void delAddressItems(int[] addressArr) throws Exception;
	
	public void selAddressItem(int user_no, int address_no) throws Exception;
	
	public Address selectAddressNum(int address_no) throws Exception;
	
	public void addVO(OrderVO orderVO) throws Exception;
	
	public Address searchSelAddress(int user_num) throws Exception;
}
