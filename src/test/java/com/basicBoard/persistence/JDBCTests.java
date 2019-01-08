package com.basicBoard.persistence;

import static org.junit.Assert.fail;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JDBCTests {
	public static Logger logger = LoggerFactory.getLogger(JDBCTests.class);
	
	@Test
	public void testConnection() {
		try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false","springstudent","springstudent")) {
			
			logger.info(conn.toString());
		} catch (SQLException e) {
			fail(e.getMessage());
		}
	}
}
