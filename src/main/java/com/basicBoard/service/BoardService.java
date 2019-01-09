package com.basicBoard.service;

import java.util.List;

import com.basicBoard.dto.BoardDTO;

public interface BoardService {
	
	public void register(BoardDTO board);
	
	public BoardDTO get(int bno);
	
	public boolean modify(BoardDTO board);
	
	public boolean remove(int bno);
	
	public List<BoardDTO> getList();
}
