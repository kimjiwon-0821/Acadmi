package com.acadmi.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pagination {
	
	private Long page;
	private Long perPage;		
	private Long startRow;		
	private Long startNum;
	private Long lastNum;		
	private String kind;		
	private String search;		
	private boolean pre;		
	private boolean next;
		
	public void makeNum(Long totalCount) {
		Long totalPage = totalCount / this.getPerPage();
		if(totalCount % this.getPerPage() != 0) {
			totalPage++;
		}
			
		Long totalBlock = totalPage / 5;
		if(totalPage % 5 != 0) {
			totalBlock++;
		}

		Long curBlock = this.getPage() / 5;
		if(this.getPage() % 5 != 0) {
			curBlock++;
		}

		startNum = (curBlock - 1) * 5 + 1;
		lastNum = curBlock * 5;
			
		if(curBlock == totalBlock) {
			lastNum = totalPage;
		}
			
		if(curBlock != 1) {
			this.pre = !this.pre;
		}
			
		if(curBlock != totalBlock) {
			this.next = true;
		}	
	}
		
	public void makeStartRow() {
		this.startRow = (this.getPage() - 1) * this.getPerPage();
	}
		
	public Long getPage() {
		if(this.page == null || this.page == 0) {
			this.page = 1L;
		}
		return this.page;		
	}
		
	public Long getPerPage() {
		if(this.perPage == null || this.perPage == 0) {
			this.perPage = 10L;
		}	
		return this.perPage;
	}
		
	public String getSearch() {
		if(this.search == null) {
			this.search = "";
		}
		return this.search;
	}	
}