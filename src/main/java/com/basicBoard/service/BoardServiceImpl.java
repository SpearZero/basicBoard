package com.basicBoard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.basicBoard.dto.BoardAttachDTO;
import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;
import com.basicBoard.mapper.BoardAttachMapper;
import com.basicBoard.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardDTO board) {
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardDTO get(int bno) {
		
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(BoardDTO board) {
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(int bno) {
		
		logger.info("remove...." + bno);
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachDTO> getAttachList(int bno) {
		
		logger.info("get Attach list by bno " + bno);
		
		return attachMapper.findByBno(bno);
	}
}
