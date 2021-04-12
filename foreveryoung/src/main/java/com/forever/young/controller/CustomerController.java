package com.forever.young.controller;

import java.text.SimpleDateFormat;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.ChangePwVO;
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
	public RedirectView postJoin(@ModelAttribute Customer customer) throws Exception {
		log.info("postJoin()");
		
		service.regist(customer);
		
		return new RedirectView("success?test=1");
	}
	
	@GetMapping("/login")
	public String getLogin() {
		log.info("getLogin()");
		
		return "member/login";
	}
	
	@PostMapping("/login_customer")
	public RedirectView postLoginCustomer(@ModelAttribute Customer customer, HttpSession session) throws Exception {
		log.info("postLoginCustomer()");
		
		Customer checkLogin = service.login(customer);
		
		if(checkLogin != null) {
			session.setAttribute("check", checkLogin.getUser_num());
			session.setAttribute("auth", "customer");
			log.info("loginSuccess");
			return new RedirectView("success?test=3");
		}
		else {
			log.info("loginFail");
			return new RedirectView("login?error=0");
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
	
	@GetMapping("/mypage")
	public String getMyPage(HttpSession session, Model model) throws Exception {
		log.info("getMypage()");
		
		//번호로 쿼리 찾아서 model에 attr 시켜서 보냄
		
		
		model.addAttribute("user_info", service.findNum((int)session.getAttribute("check")));
		
		return "member/mypage";
	}
	
	@GetMapping("/success")
	public String successTest() {
		log.info("testPage()");
		
		return "member/success";
	}
	
	@GetMapping("/mypage_edit")
	public String getMypage_edit(HttpSession session, Model model) throws Exception {
		log.info("getMypage_edit()");
		
		Customer customer = service.findNum((int)session.getAttribute("check"));
		
		if(customer.getUser_birth() != null) {
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			String user_birth_fomatting = f.format(customer.getUser_birth());
			model.addAttribute("user_birth_date", user_birth_fomatting);
		}
		
		model.addAttribute("user_info", customer);
		
		return "member/mypage_edit";
	}
	
	@PostMapping("/mypage_edit")
	public String PostMypage_edit(@ModelAttribute Customer customer) throws Exception {
		log.info("PostMypage_edit()");
		
		log.info(customer.toString());
		service.editInfo(customer);
		
		return "member/success";
	}
	
	@GetMapping("/mypage_edit_pw")
	public String getMypage_edit_pw(HttpSession session, Model model) throws Exception {
		log.info("getMypage_edit_pw()");
		
		Customer customer = service.findNum((int)session.getAttribute("check"));
		
		model.addAttribute("user_info", customer);
		
		return "member/mypage_edit_pw";
	}
	
	@PostMapping("/mypage_edit_pw")
	public String PostMypage_edit_pw(@ModelAttribute ChangePwVO changePwVO) throws Exception {
		log.info("PostMypage_edit_pw()");
		
		service.editPw(changePwVO);
		
		return "member/success";
	}
	
	@GetMapping("/logout")
	public String getLogout(HttpSession session) throws Exception {
		log.info("getLogout()");
		
		session.removeAttribute("check");
		session.removeAttribute("auth");
		
		return "main";
	}
	
//	판메자 페이지 메인 맵핑
	@GetMapping("/mypage_brand/mypage_brand_main")
	public String getMypage_brand_main() {
		log.info("getMypage_brand_main()");
		return "member/mypage_brand/mypage_brand_main";
	}
	
	//사용자/판매자 회원가입 선택 페이지
	@RequestMapping("/join_choice")
	public String join_choice() {
		return "member/join_choice";
	}
}
