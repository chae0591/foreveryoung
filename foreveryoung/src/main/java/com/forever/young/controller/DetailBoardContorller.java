package com.forever.young.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forever.young.entity.Product;
import com.forever.young.entity.Review;
import com.forever.young.service.ProductService;
import com.forever.young.service.ReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller {
	@Autowired
	private ProductService service;
	
	@Autowired
	private ReviewService reviewservice;
	
	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/detail_main")
	public String detailmain(Model model, @RequestParam("no") int no) throws Exception {
		
		Product product = service.findByNo(no);
		List<Review> list = reviewservice.reviewlist(no);
		model.addAttribute("product", product);
		model.addAttribute("review",list );
		System.out.println(no);
		return "/detail_board/detail_main";
	}
	

}