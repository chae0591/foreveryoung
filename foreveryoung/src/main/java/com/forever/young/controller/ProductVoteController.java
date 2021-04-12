package com.forever.young.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forever.young.service.ProductVoteService;

@Controller
@RequestMapping("/vote")
public class ProductVoteController {
	
	@Autowired
	private ProductVoteService voteService;
	
	
	@PostMapping("/insertVote")
	@ResponseBody
	public String insertVote(@RequestParam Map<String, Object> vote) {
		voteService.inVote(vote);
		return "true";
	}
	
	@PostMapping("/deleteVote")
	@ResponseBody
	public String deleteVote(@RequestParam Map<String, Object> vote) {
		voteService.delVote(vote);
		return "false";
	}
	
	@GetMapping("/selectVote")
	@ResponseBody
	public List<String> selectVote(@RequestParam int user_num) {
		System.out.println(user_num);
		List<String> result = voteService.findVote(user_num);
		
		return result;
	}

}
