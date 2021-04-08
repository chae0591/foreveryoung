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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Event;
import com.forever.young.entity.Notice;
import com.forever.young.repository.AdminRepository;
import com.forever.young.service.AdminService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin")
public class AdminController { 
	
	@Autowired
	private AdminService service;
	
	private final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	
	@GetMapping("/success")
	public String getsuccess() {
		log.info("getsuccess()");
		
		return "admin/success";
	}
	
	//대시보드 화면
	@GetMapping("/dashBoard")
	public String getDashBoard() {
		log.info("getDashBoard()");
		
		return "admin/dashBoard";
	}
	
	//관리자 로그인Get
	@GetMapping("/login")
	public String getLogin() {
		log.info("getLogin()");
		
		return "admin/login";
	}
	
	//관리자 로그인post
	@PostMapping("/login")
	public  RedirectView postLogin(@ModelAttribute Admin admin , HttpSession session) throws Exception{
		log.info("postLogin()");
		
		Admin adminLogin = service.login(admin);
		
		if(adminLogin != null) {
			session.setAttribute("check", adminLogin.getAdmin_no());
			session.setAttribute("auth", "admin");
			log.info("login Success");
			return new RedirectView("dashBoard");
			
		}else {
			log.info("login Failure");
			return new RedirectView("login");
			
		}
	}
	
	//관리자 로그아웃 Get
	@GetMapping("/logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	//관리자 등록Get
	@GetMapping("/join")
	public void getJoin(Admin admin, Model model) {
		log.info("getJoin()");
		
	}
	
	//관리자 등록 Post
	@PostMapping("/join")
	public String postJoin(Admin admin, Model model) throws Exception{
		log.info("postJoin()");
		
		service.join(admin);
		
		return "admin/success";
	}
	
	//관리자리스트
	@GetMapping("/adminList")
	public void adminList(Model model) throws Exception{
		log.info("adminList()");
		
		model.addAttribute("adminList", service.adminList());
		
	}
	
	//브랜드리스트
	@GetMapping("/brandList")
	public void brandList(Model model) throws Exception{
		log.info("brandList()");
		
		model.addAttribute("brandList", service.brandList());
		
	}
	
	//고객리스트
	@GetMapping("/customerList")
	public void customerList(Model model) throws Exception{
		log.info("customerList()");
		
		model.addAttribute("customerList", service.customerList());
		
	}
	
	//상품리스트
	@GetMapping("/productList")
	public void productList(Model model) throws Exception{
		log.info("productList()");
		
		model.addAttribute("productList", service.productList());
	}
	
	
	//이벤트리스트
	@GetMapping("/eventList")
	public void eventList(Model model) throws Exception{
		log.info("eventList()");
		
		model.addAttribute("eventList", service.eventList());
	}
	
	//공지사항리스트
	@GetMapping("/noticeList")
	public void noticeList(Model model) throws Exception{
		log.info("noticeList()");
		
		model.addAttribute("noticeList", service.noticeList());
	}
	
	//1:1문의 리스트
	@GetMapping("/inquiryList")
	public void inquiryList(Model model) throws Exception{
		log.info("inquiryList()");
		
		model.addAttribute("inquiryList", service.inquiryList());
	}
	
	
	//이벤트 등록GET
	@GetMapping("/eventRegister")
	public void getEventRegister(Event event, Model model) throws Exception{
		log.info("getEventRegister()");
		
		
	}
	
	//이벤트 등록POST
	@PostMapping("/eventRegister")
	public String postEventRegister(Event event, Model model) throws Exception{
		log.info("postEventRegister()");
		
		service.eventRegister(event);
		
		model.addAttribute("msg" , "이벤트 등록이 성공적으로 완료되었습니다.");
		
		return "admin/success";
	}
	
	//공지사항 등록GET
	@GetMapping("/noticeRegister")
	public void getNoticeRegister(Notice notice, Model model) throws Exception{
		log.info("getNoticeRegister()");
		
	}
	
	//공지사항 등록 POST
	@PostMapping("/noticeRegister")
	public String postNoticeRegister(Notice notice, Model model) throws Exception{
		log.info("postNoticeRegister()");
		
		service.noticeRegister(notice);
		
		model.addAttribute("msg", "공지사항 등록이 성공적으로 완료되었습니다.");
		
		return "admin/success";
	}
	
	//통계(회원분석) 화면
	@GetMapping("/staticCustomer")
	public String getStaticCustomer() {
		log.info("getStaticCustomer()");
		
		return "admin/staticCustomer";
	}
	
	//통계(매출분석) 화면
	@GetMapping("/staticSales")
	public String getStaticSales() {
		log.info("getStaticSales()");
		
		return "admin/staticSales";
	}
	
	//공지사항 상세보기
	@GetMapping("/noticeDetail")
	public void getNoticeDetail(int notice_no, Model model) throws Exception {
		log.info("getNoticeDetail()");
		
		model.addAttribute("noticeDetail",service.noticeDetail(notice_no));
	}
	
	//1:1문의 상세보기
	@GetMapping("/inquiryDetail")
	public void getInquiryDetail(int inquiry_no, Model model) throws Exception{
		log.info("getInquiryDetail()");
		
		model.addAttribute("inquiryDetail" , service.inquiryDetail(inquiry_no));
	}
	
	
}
