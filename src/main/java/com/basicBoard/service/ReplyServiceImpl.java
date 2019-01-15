package com.basicBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basicBoard.dto.Criteria;
import com.basicBoard.dto.ReplyDTO;
import com.basicBoard.dto.ReplyPageDTO;
import com.basicBoard.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public int register(ReplyDTO dto) {
		
		return mapper.insert(dto);
	}

	@Override
	public int modify(ReplyDTO dto) {
		
		return mapper.update(dto);
	}

	@Override
	public int remove(int rno) {
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyDTO> getList(Criteria cri, int bno) {
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno),
							mapper.getListWithPaging(cri, bno));
	}
}
