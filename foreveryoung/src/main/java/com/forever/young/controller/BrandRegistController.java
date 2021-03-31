package com.forever.young.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forever.young.entity.Brand;
import com.forever.young.service.BrandRegistService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class BrandRegistController {
	@Autowired
	private BrandRegistService service;
	
	private final Logger log = LoggerFactory.getLogger(CustomerController.class);
	
	@GetMapping("/join_brand")
	public String getJoinBrand() {
		log.info("getJoinBrand()");
		
		return "member/join_brand";
	}
	
	@PostMapping("/join_brand")
	public String postJoinBrand(@ModelAttribute Brand brand) throws Exception {
		log.info("postJoinBrand()");
		
		service.regist(brand);
		
		return "member/success";
	}
	
	@PostMapping("/login_brand")
	public String postLoginBrand(@ModelAttribute Brand brand, HttpSession session) throws Exception {
		log.info("postLoginBrand()");
		
		boolean checkLogin = service.login(brand);
		if(checkLogin) {
			session.setAttribute("check", brand.getBrand_num());
			session.setAttribute("auth", "seller");
			return "member/success";
		}
		else {
			return "member/login_test";
		}
	}

}
