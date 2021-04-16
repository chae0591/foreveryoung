package com.forever.young.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.forever.young.entity.Product;

public interface DetailBoardService {
	public List<Product> mainList()throws Exception;

	
}
