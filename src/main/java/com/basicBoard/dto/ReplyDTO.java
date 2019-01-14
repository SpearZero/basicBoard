package com.basicBoard.dto;

import java.util.Date;

public class ReplyDTO {
	
	private int rno;
	private int bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
	public ReplyDTO() {}

	public ReplyDTO(int bno, String reply, String replyer) {
		this.bno = bno;
		this.reply = reply;
		this.replyer = replyer;
	}


	public int getRno() {
		return rno;
	}
	
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getReply() {
		return reply;
	}
	
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	public String getReplyer() {
		return replyer;
	}
	
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	
	public Date getReplyDate() {
		return replyDate;
	}
	
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}
