package com.forever.young.entity;

public class Paging {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private int pageNum;
	private int amount;
	
	
	public Paging() {
		super();
	}
	
	public Paging(int pageNum, int amount, int total) {
		// 1페이지 20개
		this.pageNum = 1;
		this.amount = 20;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(this.pageNum/10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int end = (int) (Math.ceil((total * 1.0) / this.amount));
		
		if(end < this.endPage) {
			this.endPage = end;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < end;
	}

	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	


}
