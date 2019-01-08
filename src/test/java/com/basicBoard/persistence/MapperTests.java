package com.basicBoard.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.basicBoard.mapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTests {
	private static Logger logger = LoggerFactory.getLogger(MapperTests.class);
	
	@Autowired
	private TestMapper testMapper;
	
	@Test
	public void testGetTime() {
		logger.info(testMapper.getClass().getName());
		logger.info(testMapper.getTime2());
	}
}
