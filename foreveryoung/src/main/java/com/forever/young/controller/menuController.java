package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class menuController {
	
	@RequestMapping(value="/skincare")
	public String skincare() {
		return "skincare";
	}
	
	@RequestMapping(value="/makeup")
	public String makeup() {
		return "makeup";
	}
	
	@RequestMapping(value="/bodycare")
	public String bodycare() {
		return "bodycare";
	}
	
	@RequestMapping(value="/haircare")
	public String haircare() {
		return "haircare";
	}
	
	@RequestMapping(value="/perfume")
	public String perfume() {
		return "perfume";
	}
	
	@RequestMapping(value="/menscare")
	public String menscare() {
		return "menscare";
	}
	
	@RequestMapping(value="/customerservice")
	public String customerservice() {
		return "customerservice";
	}
}
