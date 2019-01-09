package com.basicBoard.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.basicBoard.dto.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceTests.class);
	
	@Autowired
	private BoardService service;
	
//	@Test
//	public void delete() {
//		
//		logger.info("RESULT : " + service.remove(18));
//	}
}
