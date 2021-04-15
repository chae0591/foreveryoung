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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Paging;
import com.forever.young.entity.Product;
import com.forever.young.service.BrandRegistService;
import com.forever.young.service.ProductService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class BrandRegistController {
	@Autowired
	private BrandRegistService service;
	
	@Autowired 
	private ProductService productService;
	
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
	
	

//	판메자 페이지 메인 맵핑
	@GetMapping("/mypage_brand/mypage_brand_main")
	public String getMypage_brand_main(HttpSession session, Model model) throws Exception {
		log.info("getMypage_brand_main()");
		//세션 없이 테스트 - 링크로 바로 이동 
		model.addAttribute("brand_info", service.findNum((int)session.getAttribute("check")));
		
		return "member/mypage_brand/mypage_brand_main";
	}
	
	//판매자 페이지 메인 - 판매자 정보 수정
	@GetMapping("/mypage_brand/mypage_brand_main_edit")
	public String getMypage_brand_main_edit(HttpSession session, Model model) throws Exception {
		log.info("getMypage_brand_main_edit()");
		
		Brand brand = service.findNum((int)session.getAttribute("check"));
		
		model.addAttribute("brand_info", brand);
		return "member/mypage_brand/mypage_brand_main_edit";
	}
	
	//판메자 정보 수정 post 
	@PostMapping("/mypage_brand/mypage_brand_main_edit")
	public String postMypage_brand_main_edit(@ModelAttribute Brand brand) throws Exception {
		log.info("PostMypage_brand_main_edit()"); 
		
		log.info(brand.toString());
		service.editBrandInfo(brand); 
		
		return "main";
	}
	
	//판매자 등록 상품 관리 
//	@GetMapping("/mypage_brand/mypage_brand_product")
//	public String getMypage_brand_product(@RequestParam String brand, Paging paging, Model model) throws Exception {
//		log.info("getMypage_brand_product()");
//		
//		int total = productService.getCountByBrand(Integer.parseInt(brand));
//		model.addAttribute("page", new Paging(paging.getPageNum(), paging.getAmount(), total));
//		
//		List<Product> list = productService.brandList(Integer.parseInt(brand));
//		
//		model.addAttribute("brand", brand);
//		model.addAttribute("list", list);
//		
//		return "member/mypage_brand/mypage_brand_product";
//	}
//	
	
	//판매자 등록 상품 관리 get
	@GetMapping("/mypage_brand/mypage_brand_product")
	public String getMypage_brand_product(HttpSession session, Model model, Product product) throws Exception {
		log.info("getMypage_brand_product");
		
		Brand brand = service.findNum((int)session.getAttribute("check"));
		
		List<Product> brandProductList = productService.getFindBrandProduct(product); 
		
		model.addAttribute("brand_info", brand); 
		model.addAttribute("product_info", brandProductList); 
		
		return "member/mypage_brand/mypage_brand_product"; 
	}
}
