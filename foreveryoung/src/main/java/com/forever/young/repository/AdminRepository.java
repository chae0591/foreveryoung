package com.forever.young.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forever.young.entity.Admin;
import com.forever.young.entity.Brand;
import com.forever.young.entity.Customer;
import com.forever.young.entity.Event;
import com.forever.young.entity.Inquiry;
import com.forever.young.entity.InquiryVO;
import com.forever.young.entity.Notice;
import com.forever.young.entity.ProductVO;

@Repository
public interface AdminRepository {
	//관리자 로그인
	public Admin login(Admin admin) throws Exception;
	//관리자 회원가입
	public void join(Admin amdin) throws Exception;
	//관리자 리스트
	public List<Admin> adminList() throws Exception;
	//브랜드 리스트
	public List<Brand> brandList() throws Exception;
	//고객 리스트
	public List<Customer> customerList() throws Exception;
	//상품 리스트
	public List<ProductVO> productList() throws Exception; 
	//이벤트 리스트
	public List<Event> eventList() throws Exception;
	//공지사항 리스트
	public List<Notice> noticeList() throws Exception;
	//1:1문의 리스트
	public List<InquiryVO> inquiryList() throws Exception;
	//이벤트 등록
	public void eventRegister(Event event) throws Exception;
	//공지사항 등록
	public void noticeRegister(Notice notice) throws Exception;
	//공지사항 상세보기
	public Notice noticeDetail(Integer notice_no) throws Exception;
	//1:1문의 상세보기
	public InquiryVO inquiryDetail(Integer inquiry_no) throws Exception;
	//공지사항 수정
	public void noticeModify(Notice notice) throws Exception;
	//공지사항 삭제
	public void noticeDelete(Integer notice_no) throws Exception;
	//1:1문의 답변등록
	public void replyRegister(InquiryVO inquiryVO) throws Exception; 
	//관리자 상세보기
	public Admin adminDetail(Integer admin_no) throws Exception;
	//관리자 수정
	public void adminModify(Admin admin) throws Exception;
 	//관리자 삭제
	public void adminDelete(Integer admin_no) throws Exception;
 	//이벤트 상세보기
	public Event eventDetail(Integer event_no) throws Exception;
	//이벤트 수정
	public void eventModify(Event event) throws Exception;
 	//이벤트 삭제
	public void eventDelete(Integer event_no) throws Exception;	
 	//1:1문의 답변 수정
	public void replyModify(InquiryVO inquiryVO) throws Exception;
 	//1:1문의 답변 삭제
	public void replyDelete(Integer inquiry_no) throws Exception;
	
 	//상품 통합검색
 	//상품 이벤트 적용
 	//리뷰신고 목록
 	//리뷰신고 블라인드 처리하기(삭제는 안됨!)
 	//리뷰신고 블라인드 취소하기
 	//통계(고객분석)
 	//통계 (매출분석)
	
	

	
	
	
	
	
}
