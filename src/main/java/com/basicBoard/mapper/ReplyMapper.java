package com.basicBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.basicBoard.dto.Criteria;
import com.basicBoard.dto.ReplyDTO;

public interface ReplyMapper {
	
	public int insert(ReplyDTO dto);
	
	public int delete(int bno);
	
	public int update(ReplyDTO repy);
	
	public List<ReplyDTO> getListWithPaging(@Param("cri")Criteria cri, @Param("bno")int bno);
}
