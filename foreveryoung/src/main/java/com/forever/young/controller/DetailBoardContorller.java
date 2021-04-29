package com.forever.young.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.forever.young.entity.Qna;
import com.forever.young.entity.QnaReply;
import com.forever.young.entity.Review;
import com.forever.young.service.DetailBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/detail_board")
public class DetailBoardContorller {

   private final Logger log = LoggerFactory.getLogger(DetailBoardContorller.class);

   @Autowired
   private DetailBoardService service;

   // 상세페이지(조회)
   @GetMapping("/detail_main")
   public String getDetail(int product_no, Model model) throws Exception {
      model.addAttribute("getDetail", service.getDetail(product_no));
      model.addAttribute("productList",service.productList());
      //리뷰
      model.addAttribute("reviewList",service.reviewList(product_no));
      //qna
      model.addAttribute("qnaList",service.qnaList(product_no));
      //qna_replyf
      model.addAttribute("qnaReplyList", service.qnaReplyList(product_no));
      
      return "detail_board/detail_main";
   }
   //리뷰 작성Get
   @GetMapping("/reviewRegister")
   public String getReviewRegister(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception {

	   model.addAttribute("getDetail", service.getDetail(product_no));

      review.setUser_num((int)session.getAttribute("check"));

      return "detail_board/reviewRegister";
   }
   //리뷰 작성 POST
   @PostMapping("/reviewRegister")
     public  RedirectView postReviewRegister(@ModelAttribute Review review, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
	    log.info("post reviewRegister()");
        review.setUser_num((int)session.getAttribute("check"));

        service.reviewRegister(review);

         model.addAttribute("reviewRegister", "리뷰가 성공적으로 완료되었습니다.");
         RedirectView rv = new RedirectView("detail_main");
         rv.addStaticAttribute("product_no", review.getProduct_no());
          return rv;
   }
   //리뷰 수정Get
   @GetMapping("/reviewModify")
   public String getReviewModify(Review review, Model model, HttpSession session, @RequestParam Integer review_num) throws Exception{
      
      model.addAttribute("review", service.findbyreviewNo(review_num));
      
      return "detail_board/reviewModify";
   }
   //리뷰 수정 Post
   @PostMapping("/reviewModify")
   public RedirectView postReviewModify(@ModelAttribute Review review, Model model,HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
      
      review.setUser_num((int)session.getAttribute("check"));
      
      service.reviewModify(review);
      
      model.addAttribute("reviewModify", "리뷰 수정이 완료되었습니다.");
       RedirectView rv = new RedirectView("detail_main");
       rv.addStaticAttribute("product_no",review.getProduct_no());
                     
        return rv;      
   }
   //리뷰 삭제
   @GetMapping("/reviewDelete")
   public String reviewDelete( Model model, HttpSession session, @RequestParam Integer review_num, @RequestParam Integer product_no) throws Exception{
      log.info("reviewDelete");
      System.out.println("시작");
     service.reviewDelete(review_num);
     log.info("끝");
       return "redirect:/detail_board/detail_main?product_no="+product_no;
   }
   
   //최근순
   @ResponseBody
   @PostMapping("/recentReview")
   public List<Review> reviewRecent(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception{
	return service.reviewRecent(product_no);
   }
   
   //오래된순
   @ResponseBody
   @PostMapping("oldReview")
   public List<Review> reviewOld(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception{
	 return service.reviewOld(product_no);
   }
   
   //평점 높은순
   @ResponseBody
   @PostMapping("highReview")
   public List<Review> reviewHigh(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception{
	   return service.reviewHigh(product_no);
   }
   
   @ResponseBody
   @PostMapping("lowReview")
   public List<Review> reviewLow(Review review, Model model, HttpSession session, @RequestParam int product_no) throws Exception{
	   return service.reviewLow(product_no);
   }
   //qna 작성Get
   @GetMapping("/qnaRegister")
   public String getqnaRegister(Qna qna, Model model, HttpSession session, @RequestParam int product_no) throws Exception {

	   model.addAttribute("getDetail", service.getDetail(product_no));

      qna.setUser_num((int)session.getAttribute("check"));

      return "detail_board/qnaRegister";
   }
   //qna 작성 POST
   @PostMapping("/qnaRegister")
     public  RedirectView postqnaRegister(@ModelAttribute Qna qna, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
	    log.info("postqnaRegister()");
        qna.setUser_num((int)session.getAttribute("check"));

        service.qnaRegister(qna);

         model.addAttribute("qnaRegister", "댓글이 성공적으로 작성되었습니다.");
         RedirectView rv = new RedirectView("detail_main");
         rv.addStaticAttribute("product_no", qna.getProduct_no());
          return rv;
   }
   //qnaReply 작성Get-------------------------------------------------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   @GetMapping("/qnaReply")
   public String getqnaReply(Qna qna,Model model, HttpSession session, @RequestParam int qna_no,@RequestParam int product_no) throws Exception {
	   
	   model.addAttribute("product_no",product_no);
	   model.addAttribute("qna_no", qna_no);
	   
	   return "detail_board/qnaReply";
   }
   //qnaReply 작성 POST
   @PostMapping("/qnaReply")
   public  RedirectView postqnaReply(@ModelAttribute QnaReply qnaReply, @RequestParam int qna_no, @RequestParam int product_no,Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
	   qnaReply.setUser_num((int)session.getAttribute("check"));
	   qnaReply.setDetail_qna_no(qna_no);
	   service.qnaReply(qnaReply,qna_no);
	   
	   model.addAttribute("qnaReply", "댓글이 성공적으로 작성되었습니다.");
	   RedirectView rv = new RedirectView("detail_main");
	   rv.addStaticAttribute("product_no", product_no);
	   return rv;
   }
}
