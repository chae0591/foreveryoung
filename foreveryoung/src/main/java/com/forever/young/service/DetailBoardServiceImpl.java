package com.forever.young.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forever.young.entity.Brand;
import com.forever.young.entity.Product;
import com.forever.young.entity.Qna;
import com.forever.young.entity.QnaReply;
import com.forever.young.entity.Review;
import com.forever.young.repository.BrandRegistRepository;
import com.forever.young.repository.DetailBoardRepository;

@Service
public class DetailBoardServiceImpl implements DetailBoardService{

	private static final Logger log =
			LoggerFactory.getLogger(DetailBoardServiceImpl.class);
	
	@Autowired
	private DetailBoardRepository repository;
	
	@Override
	public Product getDetail(Integer product_no) throws Exception {
		return repository.getDetail(product_no);
	}
	
	  @Override public List<Product> productList() throws Exception { 
		 return repository.productList();
	  }

	@Override
	public List<Review> reviewList(int product_no) throws Exception {
		return repository.reviewList(product_no);
	}

	@Override
	public void reviewRegister(Review review) throws Exception {
		repository.reviewRegister(review);
	}

	@Override
	public int reviewRegisterAfter() throws Exception {
		return repository.reviewRegisterAfter();
	}

	@Override
	public void reviewModify(Review review) throws Exception {
		repository.reviewModify(review);
	}

	@Override
	public Review findbyreviewNo(Integer review_num) throws Exception {
		return repository.findbyreviewNo(review_num);
	}

	@Override
	public void reviewDelete(Integer review_num) throws Exception {
		repository.reviewDelete(review_num);
	}

	@Override
	public List<Review> reviewRecent(int product_no) throws Exception {
		return repository.reviewRecent(product_no);
	}

	@Override
	public List<Review> reviewOld(int product_no) throws Exception {
		return repository.reviewOld(product_no);
	}

	@Override
	public List<Review> reviewHigh(int product_no) throws Exception {
		return repository.reviewHigh(product_no);
	}

	@Override
	public List<Review> reviewLow(int product_no) throws Exception {
		return repository.reviewLow(product_no);
	}

	@Override
	public List<Qna> qnaList(int product_no) throws Exception {
		return repository.qnaList(product_no);
	}

	@Override
	public List<QnaReply> qnaReplyList(int product_no) throws Exception {
		return repository.qnaReplyList(product_no);
	}

	@Override
	public void qnaRegister(Qna qna) throws Exception {
		repository.qnaRegister(qna);
	}

	@Override
	public void qnaReply(QnaReply qnaReply) throws Exception {
		repository.qnaReply(qnaReply);
	}
}