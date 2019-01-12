package com.basicBoard.mapper;

import java.util.List;
import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;

public interface BoardMapper {
	
	public List<BoardDTO> getList();
	
	public void insert(BoardDTO board);
	
	public void insertSelectKey(BoardDTO board);
	
	public BoardDTO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardDTO board);
	
	public List<BoardDTO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
