
package com.forever.young.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.forever.young.entity.Product;
import com.forever.young.service.MainService;
import com.forever.young.service.ProductService;

import lombok.extern.java.Log;

@Log
@Controller
public class MainController {

	private final Logger log =
			LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService service;
	
	
	//메인화면(상품리스트 불러오기)
	@GetMapping("/main")
	public void productList(Model model) throws Exception{
		log.info("main()");
		
		model.addAttribute("main", service.productList());
	}

}