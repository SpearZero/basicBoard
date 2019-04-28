package com.basicBoard.test;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;
import com.basicBoard.dto.ReplyDTO;
import com.basicBoard.mapper.BoardMapper;
import com.basicBoard.mapper.ReplyMapper;
import com.basicBoard.mapper.UserMapper;
import com.basicBoard.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	private static Logger logger = LoggerFactory.getLogger(MapperTest.class);
	
	@Autowired
	private UserService service;
	
	@Test
	public void test() {
		System.out.println(service.checkIdExist("test"));
	}
		
}
