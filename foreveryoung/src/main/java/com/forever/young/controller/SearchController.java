package com.forever.young.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {

	@RequestMapping(value="/search_results")
	public String search_results() {
		return "search/search_results";
	}

}
