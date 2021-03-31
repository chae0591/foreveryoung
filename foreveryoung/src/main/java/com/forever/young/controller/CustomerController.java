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
		
		service.regist(customer);
		
		return "member/success";
	}
	
	@GetMapping("/login_test")
	public String getLogin() {
		log.info("getLogin()");
		
		return "member/login_test";
	}
	
	@PostMapping("/login_customer")
	public String postLoginCustomer(@ModelAttribute Customer customer, HttpSession session) throws Exception {
		log.info("postLoginCustomer()");
		
		boolean checkLogin = service.login(customer);
		
		if(checkLogin) {
			session.setAttribute("check", customer.getUser_num());
			session.setAttribute("auth", "customer");
			log.info("loginSuccess");
			return "member/success";
		}
		else {
			log.info("loginFail");
			return "member/login_test";
		}
	}
	
	@GetMapping("/id_check")
	@ResponseBody
	public String idDuplicate(@RequestParam String user_id) throws Exception {
		log.info("idDuplicate()");
		Customer customer = service.findId(user_id);
		
		if(customer == null) {
			return "Y";
		}
		else {
			return "N";
		}
	}
}
