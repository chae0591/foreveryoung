package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category")
public class ServiceCenterController {
	
	@RequestMapping(value="/service_center")
	public String serviceCenter() {
		return "category/service_center";
	}
}
