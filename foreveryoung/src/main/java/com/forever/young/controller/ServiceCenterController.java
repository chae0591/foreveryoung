package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service_center")
public class ServiceCenterController {
	
	@RequestMapping(value="/notice")
	public String notice() {
		return "service_center/notice";
	}
	@RequestMapping(value="/inquiry")
	public String inquiry() {
		return "service_center/inquiry";
	}
	@RequestMapping(value="/inquiry_detail")
	public String inquiry_detail() {
		return "service_center/inquiry_detail";
	}
}
