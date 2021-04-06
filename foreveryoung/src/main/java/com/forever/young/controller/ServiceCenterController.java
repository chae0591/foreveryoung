package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service_center")
public class ServiceCenterController {
	
	@RequestMapping(value="/notice")
	public String serviceCenter() {
		return "service_center/notice";
	}
}
