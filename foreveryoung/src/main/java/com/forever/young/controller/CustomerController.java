package com.forever.young.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.forever.young.entity.CartListVO;
import com.forever.young.entity.ChangePwVO;
import com.forever.young.entity.Customer;
import com.forever.young.entity.Order;
import com.forever.young.service.AddressService;
import com.forever.young.service.CartService;
import com.forever.young.service.CustomerService;
import com.forever.young.service.OrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	@Autowired
	private OrderService service_or;
	@Autowired
	private CartService service_ca;
	@Autowired
	private AddressService service_ad;
	
	private final Logger log = LoggerFactory.getLogger(CustomerController.class);
	
	@GetMapping("/joinAgreement")
	public String getJoinAgreement() {
		log.info("getJoinAgreement()");
		
		return "member/joinAgreement";
	}
	
	
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
		
		int user_num = (int)session.getAttribute("check");
		
		
		model.addAttribute("user_info", service.findNum(user_num));
		
		List<Order> order_list = service_or.searchUserNum(user_num);
		
		List<Integer> proList = new ArrayList<>();
		for(Order order : order_list) {
			proList.add(order.getOrder_product());
		}
		
		model.addAttribute("order_info", order_list);
		model.addAttribute("product_info", service_or.searchListVO(user_num, 30));
		model.addAttribute("inquiry_info", service.findNumInquiry(user_num, 30));
		model.addAttribute("address_info", service_ad.searchSelAddress(user_num));
		
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
	
	@GetMapping("/contractList")
	public String getContractList(HttpSession session, Model model) throws Exception{
		log.info("getContractList()");
		
		List<Order> order_list = service_or.searchUserNum((int)session.getAttribute("check"));
		
		List<Integer> proList = new ArrayList<>();
		for(Order order : order_list) {
			proList.add(order.getOrder_product());
		}
		
		model.addAttribute("order_info", order_list);
		model.addAttribute("product_info", service_or.searchListVO((int)session.getAttribute("check"), 30));
		
		return "member/contractList";
	}

	//사용자/판매자 회원가입 선택 페이지
	@RequestMapping("/join_choice")
	public String join_choice() {
		return "member/join_choice";
	}
	
	@GetMapping("/test")
	public String getTest(HttpSession session, Model model) throws Exception {
		log.info("getTest()");
		log.info("getMypage_edit_pw()");
		
		Customer customer = service.findNum((int)session.getAttribute("check"));
		
		model.addAttribute("user_info", customer);
		
		return "member/testpage";
	}
	
	@GetMapping("/my_vote")
	public String getMyVote(HttpSession session, Model model) throws Exception {
		log.info("getMyVote()");
		
		model.addAttribute("my_vote_list", service.myVoteList((int)session.getAttribute("check")));
		
		return "member/my_vote";
	}
	
	@GetMapping("/my_inquiry")
	public String getMyInquiry(HttpSession session, Model model) throws Exception {
		log.info("getMyInquiry()");
		
		model.addAttribute("inquiry_info", service.findNumInquiry((int)session.getAttribute("check"), 30));
		
		return "member/my_inquiry";
	}
	
	@PostMapping("/my_inquiry_search_by_day")
	public String getSearchMyInquiryDate(@RequestParam int dayval, Model model, HttpSession session) throws Exception {
		log.info("getsearchInquiryDate()");
		
		model.addAttribute("inquiry_info", service.findNumInquiry((int)session.getAttribute("check"), dayval));
		
		return "/member/inquiry_search";
	}
	
	@PostMapping("/my_inquiry_search_by_date")
	public String searchInquiryDate(@RequestParam String start_date, @RequestParam String end_date, Model model, HttpSession session) throws Exception {
		log.info("inquiry_search_by_date_btn()");
		
		log.info("date1 : " + start_date);
		log.info("date2 : " + end_date);
		
		if(!start_date.isEmpty()) {
			start_date = "'".concat(start_date).concat(" 00:00:00'");
		}
		
		if(!end_date.isEmpty()) {
			end_date = "'".concat(end_date).concat(" 23:59:59'");
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("user_num", (int)session.getAttribute("check"));
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		
		model.addAttribute("inquiry_info", service.searchInquiryDate(param));
		
		return "/member/inquiry_search";
	}
	
	@PostMapping("/inquiry_search_by_target")
	public String searchOrderTarget(@RequestParam String target, Model model, HttpSession session) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		param.put("user_num", (int)session.getAttribute("check"));
		param.put("target", target);
		
		model.addAttribute("inquiry_info", service.searchInquirTarget(param));
		
		return "/member/inquiry_search";
	}

}

