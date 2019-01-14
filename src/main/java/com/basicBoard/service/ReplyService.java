package com.basicBoard.service;

import java.util.List;

import com.basicBoard.dto.Criteria;
import com.basicBoard.dto.ReplyDTO;

public interface ReplyService {
	
	public int register(ReplyDTO dto);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int rno);
	
	public List<ReplyDTO> getList(Criteria cri, int bno);
}
