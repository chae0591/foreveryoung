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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

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
	public RedirectView postJoinBrand(@ModelAttribute Brand brand) throws Exception {
		log.info("postJoinBrand()");
		
		service.regist(brand);
		
		return new RedirectView("success?test=2");
	}
	
	@PostMapping("/login_brand")
	public RedirectView postLoginBrand(@ModelAttribute Brand brand, HttpSession session) throws Exception {
		log.info("postLoginBrand()");
		
		Brand checkLogin = service.login(brand);
		if(checkLogin != null) {
			session.setAttribute("check", checkLogin.getBrand_num());
			session.setAttribute("auth", "seller");
			return new RedirectView("success?test=3");
		}
		else {
			return new RedirectView("login?error");
		}
	}
	
	@GetMapping("/brand_id_check")
	@ResponseBody
	public String brandIdDuplicate(@RequestParam String brand_id) throws Exception {
		log.info("brandIdDuplicate()");
		Brand brand = service.findId(brand_id);
		
		if(brand == null) {
			return "Y";
		}
		else {
			return "N";
		}
	}

}
