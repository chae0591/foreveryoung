package com.forever.young.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forever.young.entity.CartListVO;
import com.forever.young.service.CartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class CartController {
	
	@Autowired
	private CartService service;
	
	private final Logger log = LoggerFactory.getLogger(CartController.class);
	

	@GetMapping("cartList")
	public String getCartList(HttpSession session, Model model) throws Exception {
		log.info("getCartList()");
		
		List<CartListVO> userCartList = service.searchListUser((int)session.getAttribute("check"));
		
		log.info("userCartList : " + userCartList.toString());
		
		if(userCartList != null) {
			model.addAttribute("userCartList", userCartList);
		}
		
		return "member/cartList";
	}
}
