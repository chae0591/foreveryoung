package com.forever.young.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Product;
import com.forever.young.repository.DetailBoardRepository;

@Service
public class DetailBoardServiceImpl implements DetailBoardService{

	private static final Logger log =
			LoggerFactory.getLogger(DetailBoardServiceImpl.class);
	
	@Autowired
	private DetailBoardRepository repository;

	@Override
	public List<Product> mainList() throws Exception {
		
		return repository.mainList();
	}
}
