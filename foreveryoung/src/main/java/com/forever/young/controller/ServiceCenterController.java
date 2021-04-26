package com.forever.young.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Inquiry;
import com.forever.young.entity.Notice;
import com.forever.young.service.AdminService;
import com.forever.young.service.Pager;
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
	
	/*
	 * //공지사항 리스트GET
	 * 
	 * @GetMapping("/notice") public String noticeList(Model model) throws Exception
	 * { return "service_center/notice";
	 * 
	 * }
	 */
	@RequestMapping("notice")
    public ModelAndView noticeList(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            @RequestParam(defaultValue="1") int curPage,
            @RequestParam(defaultValue="") String keyword   //키워드의 기본값을 ""으로 한다.
            )
             throws Exception{
		
		log.info("noticeList()");
		
        //레코드 갯수를 계산
        int count = 1000;
        
        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
        Pager pager = new Pager(count, curPage);
        int start = pager.getPageBegin();
        int end =  pager.getPageEnd();
             
        //map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
        List<Notice> noticeList = service.listAll(keyword, start, end);
        
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        
        map.put("noticeList", noticeList);                     //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
        map.put("pager", pager);
        map.put("count", count);
        map.put("keyword", keyword);
        mav.addObject("map", map);                           //modelandview에 map를 저장
        
        mav.setViewName("service_center/notice");    //자료를 넘길 뷰의 이름
        
        return mav;    //게시판 페이지로 이동
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