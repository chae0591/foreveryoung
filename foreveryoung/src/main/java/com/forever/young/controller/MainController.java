
package com.forever.young.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Notice;
import com.forever.young.entity.Paging;
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
	@GetMapping("main")
	public String productList(Model model) throws Exception {

		List<Product> randomList = service.randomList();
		List<Product> bestList = service.bestList("skincare");
		List<Product> newList = service.newList();
		
		model.addAttribute("randomList", randomList);
		model.addAttribute("newList", newList);
		model.addAttribute("bestList", bestList);
		
		return "main";
	}
	
	//메인화면(베스트 카테고리별 불러오기)
	@PostMapping("mainBest")
	public String bestLankList(Model model, @RequestParam String lankval) throws Exception {

			List<Product> randomList = service.randomList();
			List<Product> bestList = service.bestList(lankval);
			List<Product> newList = service.newList();
			
			model.addAttribute("randomList", randomList);
			model.addAttribute("newList", newList);
			model.addAttribute("bestList", bestList);
			
			return "mainBest";
		}
	
	//메인화면(검색 후 페이지 이동)
	@RequestMapping("search/searchResults")
    public ModelAndView searchList( @RequestParam(defaultValue="") String keyword) throws Exception{
		log.info("searchList()");
		
        //map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
        List<Product> searchList = service.searchList(keyword);
        
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        
        map.put("searchList", searchList);                     //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
        map.put("keyword", keyword);
        mav.addObject("map", map);                           //modelandview에 map를 저장
        
        mav.setViewName("search/searchResults");    //자료를 넘길 뷰의 이름
        
        return mav;    //게시판 페이지로 이동
    }

}