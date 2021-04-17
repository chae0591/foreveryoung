package com.forever.young.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forever.young.service.DetailBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller{
	
	private final Logger log = 
			LoggerFactory.getLogger(DetailBoardContorller.class);
	
	@Autowired
	private DetailBoardService service;
		
	//상세페이지
	@GetMapping("/detail_main")
	public String getDetial(int product_no,Model model)throws Exception{
		log.info("getDetail()");
		model.addAttribute("getDetail", service.getDetail(product_no));
		
		return "detail_board/detail_main";
	}
	
	/*
	 * //상품 정보받아오기 public String product(Model model)throws Exception{
	 * log.info("productList()"); model.addAttribute("productList",
	 * service.productList());
	 * 
	 * return "detail_board/detail_main"; }
	 */
	
}