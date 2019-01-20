package com.basicBoard.mapper;

import java.util.List;

import com.basicBoard.dto.BoardAttachDTO;

public interface BoardAttachMapper {

	public void insert(BoardAttachDTO dto);
	
	public void delete(String uuid);
	
	public List<BoardAttachDTO> findByBno(int bno);
	
	public void deleteAll(int bno);
}
