package com.forever.young.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;
import com.forever.young.service.AdminService;
import com.forever.young.service.ServiceCenterService;

import lombok.extern.java.Log;

import com.forever.young.repository.ServiceCenterRepository;

@Log
@Controller
@RequestMapping("/service_center")
public class ServiceCenterController {
	
	private final Logger log =
			LoggerFactory.getLogger(ServiceCenterController.class);
	
	@Autowired
	private ServiceCenterService service;
	
	//공지사항 리스트GET
	@GetMapping("/notice")
	public String noticeList(Model model) throws Exception {
		log.info("noticeList()");
			
		model.addAttribute("noticeList", service.noticeList());
		
		return "service_center/notice";
	}
		
	//1:1문의 리스트GET
	@GetMapping("/inquiry")
	public String inquiryList(Model model, HttpSession session) throws Exception {
		log.info("inquiryList()");
		
		model.addAttribute("inquiryList", service.inquiryList((int)session.getAttribute("check")));
		
		return "service_center/inquiry";
	}
	
	//1:1문의 작성GET
	@GetMapping("/inquiryRegister")
	public String getInquiryRegister(Inquiry inquiry, Model model, HttpSession session) throws Exception {
		log.info("getInquriyRegister()");
		
		inquiry.setUser_num((int)session.getAttribute("check"));
		
		return "service_center/inquiryRegister";
	}
	
	//1:1문의 작성POST
	@PostMapping("/inquiryRegister")
	  public RedirectView postInquiryRegister(Inquiry inquiry, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		 log.info("postInquiryRegister()");
	      
	     inquiry.setUser_num((int)session.getAttribute("check"));
	         
	     service.inquiryRegister(inquiry);
	         
	      model.addAttribute("inquiryRegister", "문의글 등록이 성공적으로 완료되었습니다.");
	       
	      RedirectView rv = new RedirectView("inquiryDetail");
	      rv.addStaticAttribute("inquiry_no", service.inquiryRegisterAfter());
	         
	      return rv;
	}
	
	//1:1문의 상세보기GET
	@GetMapping("/inquiryDetail")
	public String getInquiryDetail(int inquiry_no, Model model) throws Exception {
		log.info("getInquiryDetail()");
		
		model.addAttribute("inquiryDetail" , service.inquiryDetail(inquiry_no));
		
		return "service_center/inquiryDetail";
	}
	
	//1:1문의 수정GET
	@GetMapping("/inquiryModify")
	public String getInquiryModify(int inquiry_no, Model model) throws Exception {
		log.info("getInquiryModify()");
	    
		model.addAttribute("inquiryModify" , service.inquiryDetail(inquiry_no));
		
		return "service_center/inquiryModify";
	}
	
	//1:1문의 수정POST
	@PostMapping("/inquiryModify")
	public RedirectView postInquiryModify(int inquiry_no, Inquiry inquiry, Model model) throws Exception {
		log.info("postInquiryModify()");
	      
	    service.inquiryModify(inquiry);
	      
	    model.addAttribute("inquiryModify", "문의글 수정완료");

	    RedirectView rv = new RedirectView("inquiryDetail");
	      
	    rv.addStaticAttribute("inquiry_no", inquiry.getInquiry_no());
	      
	    return rv;
	}
	
	//1:1문의 삭제POST
	@PostMapping("/inquiryDelete")
	public RedirectView inquiryDelete(int inquiry_no, Model model) throws Exception {
		log.info("inquiryDelete()");
		
		service.inquiryDelete(inquiry_no);
		
		model.addAttribute("inquiryDelete" , "문의글 삭제완료");
		
		return new RedirectView("inquiry");
	}

}