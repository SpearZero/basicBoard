package com.basicBoard.mapper;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {
	
	@Select("SELECT now()")
	public String getTime();
	
	public String getTime2();
}
