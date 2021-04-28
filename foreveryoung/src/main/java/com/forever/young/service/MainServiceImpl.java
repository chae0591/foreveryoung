package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Notice;
import com.forever.young.entity.Product;
import com.forever.young.repository.MainRepository;
import com.forever.young.repository.ServiceCenterRepository;

@Service
public class MainServiceImpl implements MainService {

	private static final Logger log =
			LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired
	private MainRepository repository;
	
	@Override
	public List<Product> mainList() throws Exception {
		return repository.mainList();
	}

	public List<Product> randomList() throws Exception {
		return repository.randomList();
	}
	
	public List<Product> bestList() throws Exception {
		return repository.bestList();
	}
	
	public List<Product> newList() throws Exception {
		return repository.newList();
	}

	//목록 (검색 기능을 포함)
	@Override
	public List<Product> searchList(String keyword) throws Exception {
		return repository.searchList(keyword);
	}
}
