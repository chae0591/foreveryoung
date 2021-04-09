package com.forever.young.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Paging;
import com.forever.young.entity.Product;
import com.forever.young.service.ProductService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@GetMapping("productWrite")
	public String getproductWrite() {
		log.info("getProductWrite()");
		
		return "product/productWrite";
		
	}
	
	@PostMapping("productWrite")
	public String postProductWrite(@ModelAttribute Product product) throws Exception {
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
	public String categoryList(@RequestParam String category, Paging paging, Model model) throws Exception {
		int total = service.getCount(category);
		model.addAttribute("page", new Paging(paging.getPageNum(), paging.getAmount(), total));
		
		List<Product> list = service.productList(category);
		List<Brand> brand = service.getBrand();
		
		model.addAttribute("brand", brand);
		model.addAttribute("category", category);
		model.addAttribute("list", list);
		
		String cName = null;
		switch(category) {
		case "skincare" :
			cName=category = "스킨케어";
			break;
		case "makeup" :
			cName=category = "메이크업";
			break;
		case "bodycare" :
			cName=category = "바디케어";
			break;
		case "haircare" :
			cName=category = "헤어케어";
			break;
		case "perfume" :
			cName=category = "향수디퓨저";
			break;
		case "manscare" :
			cName=category = "남성케어";
			break;
		}
		
		model.addAttribute("cName", cName);
		return "product/categoryList";
	}
	
	// 검색하기
	@PostMapping("search")
	public String search(@RequestParam String category, @RequestParam(value="type", required=false) String type, @RequestParam(value="brand", required=false) String brand, Model model) throws Exception {
		
		String[] sType = type.split(",");
		String[] param = brand.split(",");
		int[] sBrand = Arrays.stream(param).mapToInt(Integer::parseInt).toArray();
		
		List<Product> list = service.productListSearch(category, sType, sBrand);
		model.addAttribute("list", list);
		
		return "product/search";
	}
} 
