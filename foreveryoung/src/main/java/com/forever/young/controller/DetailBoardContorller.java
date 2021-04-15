package com.forever.young.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forever.young.entity.Product;
import com.forever.young.service.ProductService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller {
	@Autowired
	private ProductService service;
	
	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/detail_main")
	public String detailmain(Model model, @RequestParam("no") int no) {
		
		Product product = service.findByNo(no);
		model.addAttribute("product", product);
		System.out.println(no);
		return null;
	}
}
