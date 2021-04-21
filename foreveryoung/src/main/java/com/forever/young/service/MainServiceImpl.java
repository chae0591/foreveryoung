package com.forever.young.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Product> productList() throws Exception {
		return repository.productList();
	}

	
}
