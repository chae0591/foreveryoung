package com.forever.young.service;

import java.util.List;

import com.forever.young.entity.Address;

public interface AddressService {
	public void addAddress(Address address) throws Exception;
	public List<Address> searchAddress(int address_customer) throws Exception;
	public void delAddressItem(int address_no) throws Exception;
	public void delAddressItems(int[] addressArr) throws Exception;
	public void selectAddressItem(int user_no, int address_no) throws Exception;
	public Address selectAddressNum(int address_no) throws Exception;
}
