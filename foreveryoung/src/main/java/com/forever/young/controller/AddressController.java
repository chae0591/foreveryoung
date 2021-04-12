package com.forever.young.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forever.young.entity.Address;
import com.forever.young.service.AddressService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class AddressController {
	
	@Autowired
	private AddressService service;
	
	private final Logger log = LoggerFactory.getLogger(AddressController.class);
	
	@GetMapping("/addressAdd")
	public String getAddressAdd() throws Exception {
		log.info("getAddressAdd()");
		
		return "member/addressAdd";
	}
	
	@PostMapping("/addressAdd")
	public String postAddressAdd(@ModelAttribute Address address) throws Exception {
		log.info("postAddressAdd()");
		
		service.addAddress(address);
		
		return "member/mypage"; //addressList로 수정할 것;
	}
	
	@GetMapping("/addressList")
	public String getAddressList(HttpSession session, Model model) throws Exception {
		log.info("getAddressList()");
		
		List<Address> adList = service.searchAddress((int)session.getAttribute("check"));
		model.addAttribute("adList", adList);
		
		return "member/addressList";
	}
	
	@GetMapping("address_item_del")
	@ResponseBody
	public String getAddressItemDel(@RequestParam int address_no) throws Exception {
		log.info("getAddressItemDel()");
		
		log.info("adderess_no : " + address_no);
		
		service.delAddressItem(address_no);
		
		return "del" + address_no;
	}
	
	@PostMapping("address_item_del")
	@ResponseBody
	public String postAddressItemDel(@RequestParam int[] addressArr) throws Exception {
		log.info("postAddressItemDel()");
		
		for(int i : addressArr) {
			log.info("i : " + i);
		}
		
		service.delAddressItems(addressArr);
		
		return "del total";
	}
	
	@GetMapping("address_item_sel")
	@ResponseBody
	public String getAddressItemSelect(HttpSession session, @RequestParam int address_no) throws Exception {
		log.info("getAddressItemSelct()");
		
		int user_no = (int)session.getAttribute("check");
		log.info("adderess_no : " + address_no);
		
		service.selectAddressItem(user_no , address_no);
		
		return "select" + address_no;
	}

}
