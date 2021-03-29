package com.forever.young.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forever.young.entity.Customer;
import com.forever.young.service.CustomerService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	
	private final Logger log = LoggerFactory.getLogger(CustomerController.class);
	
	@GetMapping("/join")
	public String getJoin() {
		log.info("getJoin()");
		
		return "member/join";
	}
	
	@PostMapping("/join")
	public String postJoin(@ModelAttribute Customer customer) throws Exception {
		log.info("postJoin()");
		
		System.out.println(customer.toString());
		
		service.regist(customer);
		
		return "member/success";
	}
	
	@GetMapping("/sample")
	public String getLogin() {
		log.info("getLogin()");
		
		return "member/sample";
	}
	
	@PostMapping("/sample")
	public String postLogin() {
		log.info("postLogin()");
		
		return "redirect:success";
	}
	

}
