package com.basicBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.basicBoard.service.UserService;

@RestController
@RequestMapping("/signup/*")
public class SignupController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping(value = "/results/{id}", produces = {MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Integer> getDuplicateResult(@PathVariable("id")String id){
		
		int dupChkResult = userService.checkIdExist(id);
		
		return new ResponseEntity<>(dupChkResult, HttpStatus.OK);
	}
}
