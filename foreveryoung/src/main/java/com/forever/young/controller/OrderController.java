package com.forever.young.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Customer;
import com.forever.young.entity.Order;
import com.forever.young.entity.OrderProductVO;
import com.forever.young.entity.OrderVO;
import com.forever.young.service.AddressService;
import com.forever.young.service.CartService;
import com.forever.young.service.CustomerService;
import com.forever.young.service.OrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService service;
	@Autowired
	private CustomerService service_cu;
	@Autowired
	private AddressService service_ad;
	@Autowired
	private CartService service_ca;
	
	private final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@GetMapping("/ordertest_cart")
	public String getOrderTest(HttpSession session, Model model, @RequestParam String[] cartList) throws Exception {
		log.info("getOrderTest()");
		
		log.info("product" + cartList);
		
		Customer customer = service_cu.findNum((int)session.getAttribute("check"));
		model.addAttribute("customerInfo", customer);
		
		if(customer.getAddress_no() != 0) {
			model.addAttribute("addressInfo", service_ad.selectAddressNum(customer.getAddress_no()));
		}
		int[] productListNum = Arrays.stream(cartList).mapToInt(Integer::parseInt).toArray();
		
		model.addAttribute("productInfo", service_ca.searchListNums(productListNum));
		
		return "order/ordertest";
	}
	
	@GetMapping("/ordertest_detail")
	public String getOrderDetail(HttpSession session, Model model, @RequestParam int product_no, @RequestParam int product_amount) throws Exception {
		log.info("getOrderDetail()");
		
		Customer customer = service_cu.findNum((int)session.getAttribute("check"));
		model.addAttribute("customerInfo", customer);
		
		if(customer.getAddress_no() != 0) {
			model.addAttribute("addressInfo", service_ad.selectAddressNum(customer.getAddress_no()));
		}
		
		OrderProductVO orderProductVO = service.searchproVO(product_no);
		orderProductVO.setCart_count(product_amount);
		List<OrderProductVO> list = new ArrayList<>();
		list.add(orderProductVO);
		
		model.addAttribute("productInfo", list);
		
		return "order/ordertest";
	}
	
	@GetMapping("/test")
	public String test() throws Exception {
		log.info("test()");
		
		return "order/test";
	}
	
	@PostMapping("/ordertest_payment")
	public RedirectView orderPayment(@ModelAttribute OrderVO orderVO, HttpSession session) throws Exception{
		log.info("orderPayment()");
		
		log.info(orderVO.toString());
		
		service_ad.addVO(orderVO);
		
		for (int i = 0; i < orderVO.getOrder_product().length; i++ ) {
			Order order_temp = new Order();
			order_temp.setOrder_customer((int)session.getAttribute("check"));
			order_temp.setOrder_product(orderVO.getOrder_product()[i]);
			order_temp.setOrder_brand(orderVO.getOrder_brand()[i]);
			order_temp.setOrder_amount(orderVO.getOrder_amount()[i]);
			order_temp.setOrder_totalPrice(orderVO.getOrder_totalPrice()[i]);
			
			service.addOrder(order_temp);
		}
		
		return new RedirectView("/member/mypage");
	}

}
