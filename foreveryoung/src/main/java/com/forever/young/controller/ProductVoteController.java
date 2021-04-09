package com.forever.young.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forever.young.service.ProductVoteService;

@Controller
@RequestMapping("/vote")
public class ProductVoteController {
	
	@Autowired
	private ProductVoteService voteService;
	
	
	@PostMapping("/insertVote")
	public ResponseEntity<String> insertVote(@RequestParam int product_no, @RequestParam int user_num) {
		System.out.println(product_no);
		System.out.println(user_num);
		voteService.inVote(product_no, user_num);
		return new ResponseEntity<>("true", HttpStatus.OK);
	}
	
	@PostMapping("/deleteVote")
	public ResponseEntity<String> deleteVote(@RequestParam int product_no, @RequestParam int user_num) {
		System.out.println(product_no);
		System.out.println(user_num);
		voteService.delVote(product_no, user_num);
		return new ResponseEntity<>("false", HttpStatus.OK);
	}
	
	@GetMapping("/selectVote")
	public ResponseEntity<List<String>> selectVote(@RequestParam int user_num) {
		System.out.println(user_num);
		List<String> a = voteService.findVote(user_num);
		
		return new ResponseEntity<>(a, HttpStatus.OK);
	}

}
