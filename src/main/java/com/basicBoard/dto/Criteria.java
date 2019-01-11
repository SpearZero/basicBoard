package com.basicBoard.dto;

public class Criteria {
	
	private int pageStart;
	private int amount;
	
	public Criteria() {}

	public Criteria(int pageStart, int amount) {
		this.pageStart = pageStart;
		this.amount = amount;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Criteria [pageStart=" + pageStart + ", amount=" + amount + "]";
	}
}
