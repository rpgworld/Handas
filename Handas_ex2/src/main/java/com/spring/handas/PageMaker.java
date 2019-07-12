package com.spring.handas;

public class PageMaker {
	private int total;
	private int totalPage;
	private int curPage;
	
	private int start;
	private int end;
	
	private int startPage;
	private int endPage;
	
	public PageMaker() {}
	
	
	public PageMaker(int curPage, int total, int pageView) {
		this.totalPage = (int) Math.ceil(1.0 * total / pageView);
		this.curPage = curPage;
		
		this.endPage = (int) Math.ceil(curPage / 10.0) * 10;
		if(this.endPage > this.totalPage) { this.endPage = this.totalPage; }
		this.startPage = endPage - 9;
		if(this.startPage < 0) { this.startPage = 1; }
		
		this.end = curPage * pageView;
		if(this.end > total) { this.end = total; }
		this.start = end - pageView  + 1;
		if(this.start < 0) { this.start = 1; }
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
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
	
	
}
