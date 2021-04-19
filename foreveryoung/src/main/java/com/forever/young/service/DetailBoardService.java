package com.forever.young.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;

public interface DetailBoardService {
	public Product getDetail(Integer product_no) throws Exception;
	public List<Product> productList()throws Exception;
}
