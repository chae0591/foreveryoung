package com.forever.young.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.forever.young.service.DetailBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller {

	private final Logger log = LoggerFactory.getLogger(DetailBoardContorller.class);

	@Autowired
	private DetailBoardService service;
	private DetailBoardService reviewservice;

	// 상세페이지(조회)
	@GetMapping("/detail_main")
	public String getDetail(int product_no, Model model) throws Exception {
		log.info("getDetail()");
		model.addAttribute("getDetail", service.getDetail(product_no));
		model.addAttribute("productList",service.productList());
		//리뷰
		model.addAttribute("reviewList",service.reviewList(product_no));
		
		return "detail_board/detail_main";
	}
	
}