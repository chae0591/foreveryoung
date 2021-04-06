package com.forever.young.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

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
	
	
	@GetMapping("categoryList/{category}")
	public String categoryList(@PathVariable("category") String category, Model model) throws Exception {
		List<Product> list = service.productList(category);
		model.addAttribute("list", list);
		
		switch(category) {
		case "skincare" :
			category = "스킨케어";
			break;
		case "makeup" :
			category = "메이크업";
			break;
		case "bodycare" :
			category = "바디케어";
			break;
		case "haircare" :
			category = "헤어케어";
			break;
		case "perfume" :
			category = "향수디퓨저";
			break;
		case "manscare" :
			category = "남성케어";
			break;
		}
		
		model.addAttribute("category", category);
		
		return "product/categoryList";
	}
} 
