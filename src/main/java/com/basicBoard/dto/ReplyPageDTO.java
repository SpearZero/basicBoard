package com.basicBoard.dto;

import java.util.List;

public class ReplyPageDTO {
	
	private int replyCnt;
	private List<ReplyDTO> list;
	
	public ReplyPageDTO() {}

	public ReplyPageDTO(int replyCnt, List<ReplyDTO> list) {
		this.replyCnt = replyCnt;
		this.list = list;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public List<ReplyDTO> getList() {
		return list;
	}
}
