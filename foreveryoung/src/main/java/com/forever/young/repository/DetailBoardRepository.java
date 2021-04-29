package com.forever.young.repository;

import java.util.List;

import com.forever.young.entity.Product;
import com.forever.young.entity.Qna;
import com.forever.young.entity.QnaReply;
import com.forever.young.entity.Review;

public interface DetailBoardRepository {
	public Product getDetail(Integer product_no) throws Exception;
	public List<Product> productList()throws Exception;
	public List<Review> reviewList(int product_no) throws Exception;
	public void reviewRegister(Review review)throws Exception;
	public void reviewModify(Review review) throws Exception;
	public Review findbyreviewNo(Integer review_num)throws Exception;
	public void reviewDelete(Integer review_num)throws Exception;
	public List<Review> reviewRecent(int product_no) throws Exception;
	public List<Review> reviewOld(int product_no) throws Exception;
	public List<Review> reviewHigh(int product_no)throws Exception;
	public List<Review> reviewLow(int product_no)throws Exception;
	public List<Qna> qnaList(int product_no)throws Exception;
	public List<QnaReply> qnaReplyList(int product_no) throws Exception;
	public void qnaRegister(Qna qna)throws Exception;
	public void qnaReply(QnaReply qnaReply)throws Exception;
	public void qnaReplyState(int detail_qna_no) throws Exception;
	public int reviewRegisterAfter()throws Exception;	
}