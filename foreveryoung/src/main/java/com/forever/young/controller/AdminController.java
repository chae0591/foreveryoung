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

import com.forever.young.entity.Admin;
import com.forever.young.service.AdminService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	private final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	//관리자 로그인Get
	@GetMapping("/login")
	public String getLogin() {
		log.info("getLogin()");
		
		return "admin/login";
	}
	
	//관리자 로그인post
	@PostMapping("/login")
	public String postLogin(@ModelAttribute Admin admin, HttpSession session) throws Exception{
		log.info("postLogin()");
		
		boolean adminLogin = service.login(admin);
		
		if(adminLogin) {
			session.setAttribute("admin", adminLogin);
			log.info("postLoginSuccess");
			return "admin/dashBoard";
		}else {		

			log.info("postLoginFail");
			return "admin/login";
		}
	}
	
	//관리자 로그아웃 Get
	@GetMapping("/logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	//관리자 등록Get
	@GetMapping("/userList/join")
	public String getJoin() {
		log.info("getJoin()");
		
		return "admin/userList/join";
	}
	
	//관리자 등록 Post
	@PostMapping("/userList/join")
	public String postJoin(@ModelAttribute Admin admin) throws Exception{
		log.info("postJoin()");
		
		service.join(admin);
		
		return "admin/success";
	}
	
	
	
	//관리자리스트
	@GetMapping("/userList/adminList")
	public void adminList(Model model) throws Exception{
		log.info("adminList()");
		
		model.addAttribute("adminList", service.adminList());
		
	}
	
	//브랜드리스트
	@GetMapping("/userList/brandList")
	public void brandList(Model model) throws Exception{
		log.info("brandList()");
		
		model.addAttribute("brandList", service.brandList());
		
	}
	
	//고객리스트
	@GetMapping("/userList/customerList")
	public void customerList(Model model) throws Exception{
		log.info("customerList()");
		
		model.addAttribute("customerList", service.customerList());
		
	}
	
	//상품리스트
	@GetMapping("/product/productList")
	public void productList(Model model) throws Exception{
		log.info("productList()");
		
		model.addAttribute("productList", service.productList());
	}
	
	
	//이벤트리스트
	@GetMapping("/event/eventList")
	public void eventList(Model model) throws Exception{
		log.info("eventList()");
		
		model.addAttribute("eventList", service.eventList());
	}
	
	//공지사항리스트
	@GetMapping("/notice/noticeList")
	public void noticeList(Model model) throws Exception{
		log.info("noticeList()");
		
		model.addAttribute("noticeList", service.noticeList());
	}
	
	//1:1문의 리스트
	@GetMapping("/inquiry/inquiryList")
	public void inquiryList(Model model) throws Exception{
		log.info("inquiryList()");
		
		model.addAttribute("inquiryList", service.inquiryList());
	}
	
	
}
