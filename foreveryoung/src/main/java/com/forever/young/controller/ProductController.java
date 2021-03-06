package com.forever.young.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forever.young.entity.Brand;
import com.forever.young.entity.BrandBanner;
import com.forever.young.entity.Paging;
import com.forever.young.entity.Product;
import com.forever.young.service.BrandBannerService;
import com.forever.young.service.BrandRegistService;
import com.forever.young.service.ProductService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private BrandRegistService brandService;
	
	@Autowired
	private BrandBannerService bannerService;
	
	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@GetMapping("productWrite")
	public String getproductWrite(HttpSession session, Model model) throws Exception {
		log.info("getProductWrite()");
		List<Brand> brand = service.getBrand();
		
		model.addAttribute("brand", brand);
		
		Brand brandName = brandService.findNum((int)session.getAttribute("check"));

		model.addAttribute("brand_info", brandName);

		return "product/productWrite";
		
	}
	
	@PostMapping("productWrite")
	public String postProductWrite(@ModelAttribute Product product, Model model) throws Exception {
		log.info("postProductWrite()");
		
		System.out.println(product.toString());
		
		service.registProduct(product);
		return "product/success"; 
	}
	
	@RequestMapping("productList")
	public ModelAndView productList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/product/productList"); 
		
		List<Map<String, Object>> list = service.selectBoardList(commandMap); 
		mv.addObject("list", list); 
		
		return mv; 
	}
	
	
	@GetMapping("categoryList")
	public String categoryList(@RequestParam String category, Model model) throws Exception {
		int total = service.getCount(category);
		Paging paging = new Paging(1, 20, total);
		
		model.addAttribute("page", paging);
		
		List<Product> list = service.categoryListWithPaging(category, paging);
		List<Brand> brand = service.getBrand();
		List<Product> best = service.getBest(category);
		model.addAttribute("brand", brand);
		model.addAttribute("list", list);
		model.addAttribute("best", best);
		model.addAttribute("category", category);
		String cName = null;
		switch(category) {
		case "skincare" :
			cName=category = "????????????";
			break;
		case "makeup" :
			cName=category = "????????????";
			break;
		case "bodycare" :
			cName=category = "????????????";
			break;
		case "haircare" :
			cName=category = "????????????";
			break;
		case "perfume" :
			cName=category = "???????????????";
			break;
		case "manscare" :
			cName=category = "????????????";
			break;
		}
		
		model.addAttribute("cName", cName);
		
		return "product/categoryList";
	}
	
	
	// ????????????
	@PostMapping("search")
	public String search(@RequestBody Map<String, Object> searchData, Model model) throws Exception {
		int total = service.productListSearch(searchData);
		Paging paging = new Paging();
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) searchData.get("paging");
		paging.setAmount(Integer.parseInt((String) map.get("amount")));
		paging.setPageNum(Integer.parseInt((String)map.get("pageNum")));
		
		List<Product> list = service.productListSearchWithPaging(searchData);
		
		model.addAttribute("page", new Paging(paging.getPageNum(), paging.getAmount(), total));
		model.addAttribute("list", list);
		
		return "/product/search";
	}

	// ????????? ?????????
	@GetMapping("brandList")
	public String brandList(@RequestParam String brand, Model model) throws Exception {
		int brand_num = Integer.parseInt(brand);
		int total = service.getCountByBrand(brand_num);
		Paging paging = new Paging(1, 20, total);
		
		model.addAttribute("page", paging);
		
		List<Product> list = service.brandListWithPaging(brand_num, paging);
		List<Product> best = service.getBrandBest(brand_num);
		Brand getBrand = brandService.findNum(brand_num);
		BrandBanner banner = bannerService.getBan(brand_num);
		model.addAttribute("brand", getBrand);
		model.addAttribute("list", list);
		model.addAttribute("best", best);
		model.addAttribute("banner", banner);
		
		return "product/brandList";
	}
	
	// ????????????
	@PostMapping("searchBrandList")
	public String searchBrandList(@RequestBody Map<String, Object> searchData, Model model) throws Exception {
		int total = service.brandListSearch(searchData);
		Paging paging = new Paging();
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) searchData.get("paging");
		paging.setAmount(Integer.parseInt((String) map.get("amount")));
		paging.setPageNum(Integer.parseInt((String)map.get("pageNum")));
		
		List<Product> list = service.brandListSearchWithPaging(searchData);
		model.addAttribute("list", list);
		model.addAttribute("page", new Paging(paging.getPageNum(), paging.getAmount(), total));
		
		return "/product/search";
	}
}