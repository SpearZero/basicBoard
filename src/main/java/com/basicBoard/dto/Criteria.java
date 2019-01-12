package com.basicBoard.dto;

public class Criteria {
	
	private int offset;
	private int amount;
	
	public Criteria() {
		this(0, 10);
	}
	
	public Criteria(int offset, int amount) {
		this.offset = offset;
		this.amount = amount;
	}
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
