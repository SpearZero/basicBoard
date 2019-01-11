package com.basicBoard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;
import com.basicBoard.mapper.BoardMapper;

@Controller
public class BoardServiceImpl implements BoardService{
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void register(BoardDTO board) {
		logger.info("registered board : " + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardDTO get(int bno) {
		
		logger.info("get!!!!!!!!!" + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardDTO board) {
		
		logger.info("Modify!!!!!!!!!!!!!!!!" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int bno) {
		
		logger.info("remove!!!!!!!!!!!!!!!" + bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		logger.info("getList!!!!!!!!!!!!!!!!!!!");
		
		return mapper.getListWithPaging(cri);
	}
}
