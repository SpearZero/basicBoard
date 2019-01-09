package com.basicBoard.mapper;

import java.util.List;
import com.basicBoard.dto.BoardDTO;

public interface BoardMapper {
	
	public List<BoardDTO> getList();
	
	public void insert(BoardDTO board);
	
	public void insertSelectKey(BoardDTO board);
	
	public BoardDTO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardDTO board);
}
