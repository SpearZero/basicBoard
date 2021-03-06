package com.basicBoard.service;

import java.util.List;

import com.basicBoard.dto.BoardAttachDTO;
import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;

public interface BoardService {
	
	public void register(BoardDTO board);
	
	public BoardDTO get(int bno);
	
	public boolean modify(BoardDTO board);
	
	public boolean remove(int bno);
	
//	public List<BoardDTO> getList();
	
	public List<BoardDTO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachDTO> getAttachList(int bno);
}
