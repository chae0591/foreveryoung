package com.forever.young.controller;

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

import com.forever.young.entity.Brand;
import com.forever.young.entity.BrandBanner;
import com.forever.young.entity.BrandProductCriteria;
import com.forever.young.entity.BrandProductPaging;
import com.forever.young.entity.Product;
import com.forever.young.service.BrandBannerService;
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
	
	@Autowired
	private BrandBannerService banService;
	
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
			return new RedirectView("mypage_brand/mypage_brand_main");
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
	
	

//	????????? ????????? ?????? ??????
	@GetMapping("/mypage_brand/mypage_brand_main")
	public String getMypage_brand_main(HttpSession session, Model model) throws Exception {
		log.info("getMypage_brand_main()");
		//?????? ?????? ????????? - ????????? ?????? ?????? 
		model.addAttribute("brand_info", service.findNum((int)session.getAttribute("check")));
		
		return "member/mypage_brand/mypage_brand_main";
	}
	
	//????????? ????????? ?????? - ????????? ?????? ??????
	@GetMapping("/mypage_brand/mypage_brand_main_edit")
	public String getMypage_brand_main_edit(HttpSession session, Model model) throws Exception {
		log.info("getMypage_brand_main_edit()");
		
		Brand brand = service.findNum((int)session.getAttribute("check"));
		
		model.addAttribute("brand_info", brand);
		return "member/mypage_brand/mypage_brand_main_edit";
	}
	
	//????????? ?????? ?????? post 
	@PostMapping("/mypage_brand/mypage_brand_main_edit")
	public String postMypage_brand_main_edit(@ModelAttribute Brand brand) throws Exception {
		log.info("PostMypage_brand_main_edit()"); 
		
		log.info(brand.toString());
		service.editBrandInfo(brand); 
		
		return "main";
	}
	
	//????????? ?????? ?????? ?????? 
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
	
	//????????? ?????? ?????? ?????? get
//	@GetMapping("/mypage_brand/mypage_brand_product")
//	public String getMypage_brand_product(HttpSession session, BrandProductCriteria cri,  Model model, Product product) throws Exception {
//		log.info("getMypage_brand_product");
//		
//		Brand brand = service.findNum((int)session.getAttribute("check"));
//		
//		List<Product> brandProductList = productService.getFindBrandProduct(product);
//		//????????? 
//		List<Product> list = productService.brandList((int)session.getAttribute("check"));
//		
//
//		//????????? - ?????? 
//		//????????? ??????
//		int ProductListCnt = service.ProductListCnt(); 
//		
//		//????????? ??????
//		BrandProductPaging paging = new BrandProductPaging();  
//		paging.setCri(cri);
//		paging.setTotalCount(ProductListCnt);
//		
//		List<Map<String, Object>> productList = service.productList(cri); 
//		model.addAttribute("productList", productList);
//		model.addAttribute("paging", paging); 
//		//????????? - ???  
//		
//		System.out.println(cri.getPageStart());
//		System.out.println(cri.getPerPageNum());
//		
//		
//		model.addAttribute("brand_info", brand); 
//		model.addAttribute("product_info", brandProductList); 
//		
//		
//		model.addAttribute("list", list);
//
//		
//		return "member/mypage_brand/mypage_brand_product"; 
//	}
	
	//????????? ?????? ?????? ?????? get
		@GetMapping("/mypage_brand/mypage_brand_product")
		public String getMypage_brand_product(HttpSession session, BrandProductCriteria cri,
					@RequestParam(defaultValue="product_name") String search_option, 
					@RequestParam(defaultValue="") String keyword, 
					Model model, Product product
					) 
					throws Exception {
			
			log.info("getMypage_brand_product");
			
			//Brand brand = service.findNum((int)session.getAttribute("check"));
			Brand brand = service.findNum(121);
			List<Product> brandProductList = productService.getFindBrandProduct(product);
			//????????? 
			//List<Product> list = productService.brandList((int)session.getAttribute("check"));
			List<Product> list = productService.brandList(121);

			//????????? - ?????? 
			//????????? ??????
			int ProductListCnt = service.ProductListCnt(); 
			//????????? ??????
			BrandProductPaging paging = new BrandProductPaging();  
			paging.setCri(cri);
			paging.setTotalCount(ProductListCnt);
			System.out.println(cri);
			Map<String, Object> map = new HashMap<>();
			map.put("cri", cri);
			map.put("brand", 121);
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			List<Product> productList = service.productList(map); //search_option, keyword
			System.out.println(productList);
			
			model.addAttribute("productList", productList);
			model.addAttribute("paging", paging); 
			//????????? - ???  
			
			System.out.println(cri.getPageStart());
			System.out.println(cri.getPerPageNum());
			
			model.addAttribute("brand_info", brand); 
			model.addAttribute("product_info", brandProductList); 
			
			
			return "member/mypage_brand/mypage_brand_product"; 
		}
	
	
	
	//?????? ?????? 
	@GetMapping("product_item_del")
	@ResponseBody
	public String getProductItemDel(@RequestParam int product_no) throws Exception{
		log.info("getProductItemDel()");
		
		log.info("product_no : " + product_no);
		
		service.deleteProduct(product_no);
		
		return "del" + product_no; 
		
	}
	
	//???????????? ??????, ????????? ???????????????
	@GetMapping("/mypage_brand/banner_page")
	public String banner_page(HttpSession session, Model model) {
		//brandImgCk ??? session ?????? imgfilename ????????? ????????????
		int brand_num = (int)session.getAttribute("check");
		BrandBanner ban = banService.getBan(brand_num);
		
		model.addAttribute("banner", ban);
		return "member/mypage_brand/banner_page";
	}
	
	@PostMapping("/mypage_brand/banner_page")
	public String banner_page(HttpSession session, BrandBanner ban) {
		int brand = (int)session.getAttribute("check");
		ban.setBrand_num(brand);
		if(banService.getBan(brand) != null) {
			banService.upBan(ban);
		} else {
			banService.banInsert(ban);
		}
		return "member/mypage_brand/mypage_brand_main";
	}
}
