package com.forever.young.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Review;
import com.forever.young.service.DetailBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller {

	private final Logger log = LoggerFactory.getLogger(DetailBoardContorller.class);

	@Autowired
	private DetailBoardService service;

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
	//리뷰 작성Get
	@GetMapping("/reviewRegister")
	public String getReviewRegister(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception {
		log.info("getReviewRegister()");
		
		model.addAttribute("getDetail", service.getDetail(product_no));
		review.setUser_num((int)session.getAttribute("check"));
		
		return "detail_board/reviewRegister";
	}
	//리뷰 작성 POST
	@PostMapping("/reviewRegister")
	  public  RedirectView postReviewRegister(@ModelAttribute Review review, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		 log.info("postReviewRegister()");
	      
	     review.setUser_num((int)session.getAttribute("check"));
	         
	     service.reviewRegister(review);
	         
	      model.addAttribute("reviewRegister", "리뷰가 성공적으로 완료되었습니다.");
	      RedirectView rv = new RedirectView("detail_main");
	      rv.addStaticAttribute("product_no", review.getProduct_no());
	                  
	       return rv;
	}
}