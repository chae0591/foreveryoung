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
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Event;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;
import com.forever.young.entity.Paging;
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
	public String getDashBoard(Model model) throws Exception{
		log.info("getDashBoard()");
		
		
		model.addAttribute("customerList", service.customerList());
		model.addAttribute("brandList", service.brandList());
		model.addAttribute("productList", service.productList());
		model.addAttribute("adminList", service.adminList());
		
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
			return new RedirectView("login?error=0");
			
		}
	}
	
	//관리자 로그아웃 Get
	@GetMapping("/logout")
	public String getLogout(HttpSession session) throws Exception {
		log.info("logout()");
		session.invalidate();
		return "redirect:/admin/login";
	}
	
	//관리자 등록Get
	@GetMapping("/join")
	public void getJoin(Admin admin, Model model) {
		log.info("getJoin()");
		
	}
	
	//관리자 등록 Post
	@PostMapping("/join")
	public RedirectView postJoin(Admin admin, Model model) throws Exception{
		log.info("postJoin()");
		
		service.join(admin);
		
		return new RedirectView("adminList");
	}
	
	//관리자리스트
	@GetMapping("/adminList")
	public String adminList(Paging paging, Model model) throws Exception{
		log.info("adminList()");
		
		int total = service.getCountByAdmin();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		model.addAttribute("admin", total);
		model.addAttribute("adminList", service.adminList());
		
		return "admin/adminList";
	}
	
	//브랜드리스트
	@GetMapping("/brandList")
	public String brandList(Paging paging, Model model) throws Exception{
		log.info("brandList()");
		
		int total = service.getCountByBrand();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		
		//model.addAttribute("page", new Paging(paging.getPageNum(), paging.getAmount(), total));
		model.addAttribute("brand", total);
		model.addAttribute("brandList", service.brandList());
		
		return "admin/brandList";
	}
	
	//고객리스트
	@GetMapping("/customerList")
	public void customerList(Paging paging, Model model) throws Exception{
		log.info("customerList()");
		
		int total = service.getCountByCustomer();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		//model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
		model.addAttribute("customer", total);
		model.addAttribute("customerList", service.customerList());
		
	}
	
	//상품리스트
	@GetMapping("/productList")
	public void productList(Paging paging, Model model) throws Exception{
		log.info("productList()");
		
		int total = service.getCountByProduct();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		model.addAttribute("product", total);
		model.addAttribute("productList", service.productList());
		model.addAttribute("brandList", service.brandList());
		model.addAttribute("eventList", service.eventList());
	}
	
	
	//이벤트리스트
	@GetMapping("/eventList")
	public void eventList(Paging paging, Model model) throws Exception{
		log.info("eventList()");
		
		int total = service.getCountByEvent();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		model.addAttribute("event", total);
		model.addAttribute("eventList", service.eventList());
	}
	
	//공지사항리스트
	@GetMapping("/noticeList")
	public void noticeList(Paging paging, Model model) throws Exception{
		log.info("noticeList()");
		
		int total = service.getCountByNotice();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		model.addAttribute("notice", total);
		model.addAttribute("noticeList", service.noticeList());
	}
	
	//1:1문의 리스트
	@GetMapping("/inquiryList")
	public void inquiryList(Paging paging, Model model) throws Exception{
		log.info("inquiryList()");

		int total = service.getCountByInquiry();
		
//		if(paging == null) {
			model.addAttribute("page", new Paging(1 ,10, total));
//		}else {
//			model.addAttribute("page", new Paging(paging.getPageNum(),10, total));
//		}
		model.addAttribute("inquiry", total);
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
		
		return "redirect:/admin/eventList";
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
		
		return "redirect:/admin/noticeList";
	}
	
	//통계 화면
	@GetMapping("/static")
	public String getStatic() {
		log.info("getStatic()");
		
		return "admin/static";
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
	
	//공지사항 수정GET
	@GetMapping("/noticeModify")
	public void getNoticeModify(int notice_no, Model model) throws Exception{
		log.info("getNoticeModify()");
		
		model.addAttribute("noticeModify" , service.noticeDetail(notice_no));
		model.addAttribute("noticeDetail",service.noticeDetail(notice_no));
	}
	
	//공지사항 수정POST
	@PostMapping("/noticeModify")
	public RedirectView  postNoticeModify(Notice notice, Model model) throws Exception{
		log.info("postNoticeModify");
		
		service.noticeModify(notice);
		
		model.addAttribute("noticeModify", "공지사항 수정완료");
		
		return new RedirectView("noticeList");
	}
	
	//공지사항 삭제
	@PostMapping("/noticeDelete")
	public RedirectView noticeDelete(int notice_no, Model model) throws Exception{
		log.info("noticeDelete()");
		
		service.noticeDelete(notice_no);
		
		model.addAttribute("noticeDelete" , "공지사항 삭제완료");
		
		return new RedirectView("noticeList");
	}
	
	//1:1문의 답변등록
	@PostMapping("/replyRegister")
	public RedirectView postReplyRegister(InquiryVO inquiryVO, Model model) throws Exception{
		log.info("postreplyRegister");
		
		service.replyRegister(inquiryVO);
		
		model.addAttribute("replyRegister", "1:1문의 답변이 등록되었습니다");
		
		return new RedirectView("inquiryList");
		
	}
	
	//관리자 상세보기GET
	@GetMapping("/adminDetail")
	public void getAdminDetail(int admin_no, Model model)throws Exception{
		log.info("getAdminDetail()");
		
		model.addAttribute("adminDetail", service.adminDetail(admin_no));
		
	}
	
	//관리자 정보 수정Get
	@GetMapping("/adminModify")
	public void getAdminModify(int admin_no, Model model , Model model1)throws Exception{
		log.info("getAdminNotify");
		
		model.addAttribute("adminModify", service.adminDetail(admin_no));
		model.addAttribute("adminDetail", service.adminDetail(admin_no));
		
	}
	
	//관리자 정보 수정POST
	@PostMapping("/adminModify")
	public RedirectView postAdminModify(Admin admin, Model model)throws Exception{
		log.info("postAdminModify");
		
		service.adminModify(admin);
		
		model.addAttribute("adminModify", "관리자 정보 수정완료");
		
		return new RedirectView("adminList");
	}
	
	//관리자 삭제
	@PostMapping("/adminDelete")
	public RedirectView adminDelete(int admin_no ,Model model) throws Exception{
		log.info("adminDelete()");
		
		service.adminDelete(admin_no);
		
		model.addAttribute("adminDelete","관리자계정 삭제 완료");
		
		return new RedirectView("adminList");
	}	
	
	//이벤트 상세보기GET
	@GetMapping("/eventDetail")
	public void geteventdetail(int event_no, Model model) throws Exception {
		log.info("geteventDetail()");
		
		model.addAttribute("eventDetail",service.eventDetail(event_no));
	}
	
	//이벤트 수정GET
	@GetMapping("/eventModify")
	public void geteventModify(int event_no, Model model, Model model1) throws Exception{
		log.info("getEventModify()");
		
		model.addAttribute("eventModify" , service.eventDetail(event_no));
		model1.addAttribute("eventDetail", service.eventDetail(event_no));
	}
	
	//이벤트 수정POST
	@PostMapping("/eventModify")
	public RedirectView postEventModify(Event event, Model model) throws Exception{
		log.info("postEventModify");
		
		service.eventModify(event);
		
		model.addAttribute("eventModify", "이벤트 정보 수정완료");
		
		return new RedirectView("eventList");
	}

	//이벤트 삭제
	@PostMapping("/eventDelete")
	public String eventDelete(int event_no, Model model) throws Exception{
		log.info("eventDelete()");
		
		service.eventDelete(event_no);
		
		model.addAttribute("eventDelete", "관리자계정 삭제 완료");
		
		return "redirect:/admin/eventList";
	}
	
	//1:1문의 답변 수정GET
	@GetMapping("/replyModify")
	public void getReplyModify(int inquiry_no, Model model,Model model1) throws Exception{
		log.info("getReplyModify()");
		
		model.addAttribute("replyModify", service.inquiryDetail(inquiry_no));
		model1.addAttribute("inquiryDetail", service.inquiryDetail(inquiry_no));
		
	}
	
	//1:1문의 답변 수정POST
	@PostMapping("/replyModify")
	public RedirectView postReplyModify(InquiryVO inquiryVO, Model model) throws Exception{
		log.info("postreplyModify()");
		
		service.replyModify(inquiryVO);
		
		model.addAttribute("replyModify", "1:1문의 답변 수정 완료");
		
		return new RedirectView("inquiryList");
		
	}
	
	//1:1문의 답변 삭제
	@PostMapping("/replyDelete")
	public RedirectView  replyDelete(int inquiry_no, Model model) throws Exception{
		log.info("replyDelete()");
		
		service.replyDelete(inquiry_no);
		
		model.addAttribute("inquiryDelete" , "1:1문의 답변 삭제");
		
		return new RedirectView("inquiryList");
	}

	
	
	
	
}
