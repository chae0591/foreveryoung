package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DetailBoardContorller {
	@RequestMapping(value="/detail_board/main")
	public String detailmain() {
		return null;
	}
}
